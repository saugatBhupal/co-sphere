import 'dart:async';
import 'package:cosphere/src/config/dependency_injection/dependency_injector.dart';
import 'package:cosphere/src/core/constants/app_enums.dart';
import 'package:cosphere/src/core/constants/media_query_values.dart';
import 'package:cosphere/src/core/domain/entities/user.dart';
import 'package:cosphere/src/core/functions/build_toast.dart';
import 'package:cosphere/src/features/explore/presentation/widgets/explore_job_details.dart';
import 'package:cosphere/src/features/jobs/data/dto/apply_job/apply_job_req_dto.dart';
import 'package:cosphere/src/features/jobs/domain/entities/job.dart';
import 'package:cosphere/src/features/jobs/presentation/viewmodel/job_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sensors_plus/sensors_plus.dart';

class ExploreJobScreen extends StatefulWidget {
  final User user;
  const ExploreJobScreen({super.key, required this.user});

  @override
  State<ExploreJobScreen> createState() => _ExploreJobScreenState();
}

class _ExploreJobScreenState extends State<ExploreJobScreen> {
  final PageController _pageController = PageController();
  List<Job> _jobs = [];
  int _currentPage = 0;
  Axis _scrollDirection = Axis.vertical;
  StreamSubscription<AccelerometerEvent>? _accelerometerSubscription;

  Set<String> _appliedJobIds = {};
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
          _applyToJob("left");
        } else if (event.x > 5) {
          _applyToJob("right");
        }
      }
    });
  }

  void _applyToJob(String direction) {
    if (_currentPage < _jobs.length) {
      final job = _jobs[_currentPage];

      _isTiltActionAllowed = false;

      context.read<JobBloc>().add(ApplyToJob(
          dto: ApplyJobReqDto(userId: widget.user.uid, jobId: job.id)));
      setState(() {
        _appliedJobIds.add(job.id);
        _jobs.remove(job);
      });

      buildToast(
          toastType: ToastType.success, msg: "Applied to ${job.jobName}");

      if (_currentPage < _jobs.length - 1) {
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
          const SnackBar(content: Text("No more jobs to scroll to!")),
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
      if (_currentPage < _jobs.length - 1) {
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
      if (_currentPage < _jobs.length - 1) {
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
          const SnackBar(content: Text("No more jobs to scroll to!")),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          sl<JobBloc>()..add(GetExploreJobs(uid: widget.user.uid)),
      child: Scaffold(
        body: BlocBuilder<JobBloc, JobState>(
          builder: (context, state) {
            if (state is GetExploreJobsFailed) {
              buildToast(toastType: ToastType.error, msg: state.message);
            }
            if (state is ApplyToJobFailed) {
              buildToast(toastType: ToastType.error, msg: state.message);
            }
            if (state is ApplyToJobSuccess) {
              buildToast(
                  toastType: ToastType.success,
                  msg: "Applied to ${state.job.jobName}");
            }
            if (context.read<JobBloc>().exploreJobs.isNotEmpty) {
              _jobs = context.read<JobBloc>().exploreJobs;

              return SizedBox(
                height: context.height,
                width: context.width,
                child: _jobs.isEmpty
                  ? const Center(
                        child: Text(
                          "No Jobs",
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
                        children: _jobs.map((job) {
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
                              context.read<JobBloc>().add(ApplyToJob(
                                  dto: ApplyJobReqDto(
                                      userId: widget.user.uid, jobId: job.id)));
                              if (details.primaryVelocity != null) {
                                if (details.primaryVelocity! > 0) {
                                  _onHorizontalSwipe("right");
                                } else {
                                  _onHorizontalSwipe("left");
                                }
                              }
                            },
                            child: ExploreJobDetails(job: job),
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
