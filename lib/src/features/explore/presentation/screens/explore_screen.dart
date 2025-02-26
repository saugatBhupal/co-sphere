import 'package:cosphere/src/config/dependency_injection/dependency_injector.dart';
import 'package:cosphere/src/core/constants/app_enums.dart';
import 'package:cosphere/src/core/constants/media_query_values.dart';
import 'package:cosphere/src/core/domain/entities/user.dart';
import 'package:cosphere/src/core/functions/build_toast.dart';
import 'package:cosphere/src/features/explore/presentation/widgets/explore_project_details.dart';
import 'package:cosphere/src/features/project/data/models/mappers/project_mappers.dart';
import 'package:cosphere/src/features/project/domain/entities/project.dart';
import 'package:cosphere/src/features/project/presentation/viewmodels/project_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExploreScreen extends StatefulWidget {
  final User user;
  const ExploreScreen({super.key, required this.user});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  final PageController _pageController = PageController();
  List<Project> _projects = [];
  int _currentPage = 0;
  Axis _scrollDirection = Axis.vertical;
  @override
  void initState() {
    super.initState();
  }

  void _updateScrollDirection(Axis direction) {
    setState(() {
      _scrollDirection = direction;
    });
  }

  void _onVerticalSwipe(String direction) {
    if (direction == "up") {
      if (_currentPage < _projects.length - 1) {
        setState(() {
          _currentPage++;
        });
        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    } else if (direction == "down") {
      if (_currentPage > 0) {
        setState(() {
          _currentPage--;
        });
        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    }
  }

  void _onHorizontalSwipe(String direction) {
    if (direction == 'left') {
      _applyToProject(_currentPage);

      if (_currentPage < _projects.length - 1) {
        setState(() {
          _currentPage++;
        });
        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("No more projects to scroll to!")),
        );
      }
    }
  }

  void _applyToProject(int index) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Applied to the project! $index")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          sl<ProjectBloc>()..add(GetExploreProjects(uid: widget.user.uid)),
      child: Scaffold(
        body: BlocBuilder<ProjectBloc, ProjectState>(
          builder: (context, state) {
            if (state is GetExploreProjectsFailed) {
              buildToast(toastType: ToastType.error, msg: state.message);
            }
            if (context.read<ProjectBloc>().exploreProjects.isNotEmpty) {
              _projects = context.read<ProjectBloc>().exploreProjects;
              return GestureDetector(
                onVerticalDragEnd: (details) {
                  _updateScrollDirection(Axis.vertical);
                  if (details.primaryVelocity != null) {
                    if (details.primaryVelocity! < 0) {
                      _onVerticalSwipe("up");
                    } else {
                      _onVerticalSwipe("down");
                    }
                  }
                },
                onHorizontalDragEnd: (details) {
                  _updateScrollDirection(Axis.horizontal);
                  if (details.primaryVelocity != null) {
                    if (details.primaryVelocity! > 0) {
                      _onHorizontalSwipe("right");
                    } else {
                      _onHorizontalSwipe("left");
                    }
                  }
                },
                child: SizedBox(
                  height: context.height,
                  width: context.width,
                  child: _projects.isEmpty
                      ? const Center(
                          child: Text(
                            "No Projects",
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                        )
                      : PageView(
                          scrollDirection: _scrollDirection,
                          controller: _pageController,
                          onPageChanged: (index) {
                            setState(() {
                              _currentPage = index;
                              print(_currentPage);
                            });
                          },
                          children: _projects.map((project) {
                            return ExploreProjectDetails(project: project);
                          }).toList(),
                        ),
                ),
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
