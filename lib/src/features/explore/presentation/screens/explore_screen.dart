import 'dart:async';

import 'package:cosphere/src/config/dependency_injection/dependency_injector.dart';
import 'package:cosphere/src/core/constants/app_enums.dart';
import 'package:cosphere/src/core/constants/media_query_values.dart';
import 'package:cosphere/src/core/domain/entities/user.dart';
import 'package:cosphere/src/core/functions/build_toast.dart';
import 'package:cosphere/src/features/explore/presentation/widgets/explore_project_details.dart';
import 'package:cosphere/src/features/project/data/dto/apply_project/apply_project_req_dto.dart';
import 'package:cosphere/src/features/project/domain/entities/project.dart';
import 'package:cosphere/src/features/project/presentation/viewmodels/project_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sensors_plus/sensors_plus.dart';

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
  StreamSubscription<AccelerometerEvent>? _accelerometerSubscription;

  Set<String> _appliedProjectIds = {};
  bool _isTiltActionAllowed = true;

  @override
  void initState() {
    super.initState();
    _listenToTilt();
  }

  @override
  void dispose() {
    _accelerometerSubscription?.cancel();
    super.dispose();
  }

  void _listenToTilt() {
    _accelerometerSubscription =
        accelerometerEventStream().listen((AccelerometerEvent event) {
      if (_isTiltActionAllowed) {
        if (event.x < -5) {
          _applyToProject("left");
        } else if (event.x > 5) {
          _applyToProject("right");
        }
      }
    });
  }

  void _applyToProject(String direction) {
    if (_currentPage < _projects.length) {
      final project = _projects[_currentPage];

      _isTiltActionAllowed = false;

      context.read<ProjectBloc>().add(ApplyToProject(
          dto: ApplyProjectReqDto(
              userId: widget.user.uid, projectId: project.id)));
      setState(() {
        _appliedProjectIds.add(project.id);
        _projects.remove(project);
      });

      buildToast(
          toastType: ToastType.success,
          msg: "Applied to ${project.projectName}");

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
      Future.delayed(const Duration(seconds: 1), () {
        setState(() {
          _isTiltActionAllowed = true;
        });
      });
    }
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
    if (direction == 'left' || direction == 'right') {
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
            if (state is ApplyToProjectFailed) {
              buildToast(toastType: ToastType.error, msg: state.message);
            }
            if (state is ApplyToProjectSuccess) {
              buildToast(
                  toastType: ToastType.success,
                  msg: "Applied to ${state.project.projectName}");
            }
            if (context.read<ProjectBloc>().exploreProjects.isNotEmpty) {
              _projects = context.read<ProjectBloc>().exploreProjects;

              return SizedBox(
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
                          });
                        },
                        children: _projects.map((project) {
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
                              context.read<ProjectBloc>().add(ApplyToProject(
                                  dto: ApplyProjectReqDto(
                                      userId: widget.user.uid,
                                      projectId: project.id)));
                              if (details.primaryVelocity != null) {
                                if (details.primaryVelocity! > 0) {
                                  _onHorizontalSwipe("right");
                                } else {
                                  _onHorizontalSwipe("left");
                                }
                              }
                            },
                            child: ExploreProjectDetails(project: project),
                          );
                        }).toList(),
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
