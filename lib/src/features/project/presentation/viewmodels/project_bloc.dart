import 'package:bloc/bloc.dart';
import 'package:cosphere/src/features/project/domain/entities/project.dart';
import 'package:cosphere/src/features/project/domain/usecases/finish_hiring_usecase.dart';
import 'package:cosphere/src/features/project/domain/usecases/get_active_project_user_usecase.dart';
import 'package:cosphere/src/features/project/domain/usecases/get_completed_project_user_usecase.dart';
import 'package:cosphere/src/features/project/domain/usecases/get_hiring_projects_user_usecase.dart';
import 'package:cosphere/src/features/project/domain/usecases/hire_user_usecase.dart';
import 'package:cosphere/src/features/project/domain/usecases/reject_user_usecase.dart';
import 'package:equatable/equatable.dart';

part 'project_event.dart';
part 'project_state.dart';

class ProjectBloc extends Bloc<ProjectEvent, ProjectState> {
  final GetHiringProjectsUserUsecase getHiringProjectsUserUsecase;
  final GetActiveProjectUserUsecase getActiveProjectUserUsecase;
  final GetCompletedProjectUserUsecase getCompletedProjectUserUsecase;
  final HireUserUsecase hireUserUsecase;
  final RejectUserUsecase rejectUserUsecase;
  final FinishHiringUsecase finishHiringUsecase;
  ProjectBloc({
    required this.getHiringProjectsUserUsecase,
    required this.getActiveProjectUserUsecase,
    required this.getCompletedProjectUserUsecase,
    required this.hireUserUsecase,
    required this.rejectUserUsecase,
    required this.finishHiringUsecase,
  }) : super(ProjectInitial()) {
    on<ProjectEvent>((event, emit) async {
      if (event is GetHiringProject) {
        await _getHiringProject(event, emit);
      }
      if (event is GetActiveProject) {
        await _getActiveProject(event, emit);
      }
      if (event is GetCompletedProject) {
        await _getCompletedProject(event, emit);
      }
    });
  }

  Future<void> _getHiringProject(
      GetHiringProject event, Emitter<ProjectState> emit) async {
    emit(const GetProjectLoading());
    try {
      final result = await getHiringProjectsUserUsecase(event.uid);
      result.fold(
        (failure) => emit(GetProjectFailed(message: failure.message)),
        (success) => emit(GetHireProjectSuccess(projects: success)),
      );
    } catch (e) {
      emit(GetProjectFailed(message: "Error: ${e.toString()}"));
    }
  }

  Future<void> _getActiveProject(
      GetActiveProject event, Emitter<ProjectState> emit) async {
    emit(const GetProjectLoading());
    try {
      final result = await getActiveProjectUserUsecase(event.uid);
      result.fold(
        (failure) => emit(GetProjectFailed(message: failure.message)),
        (success) => emit(GetActiveProjectSuccess(projects: success)),
      );
    } catch (e) {
      emit(GetProjectFailed(message: "Error: ${e.toString()}"));
    }
  }

  Future<void> _getCompletedProject(
      GetCompletedProject event, Emitter<ProjectState> emit) async {
    emit(const GetProjectLoading());
    try {
      final result = await getCompletedProjectUserUsecase(event.uid);
      result.fold(
        (failure) => emit(GetProjectFailed(message: failure.message)),
        (success) => emit(GetCompletedProjectSuccess(projects: success)),
      );
    } catch (e) {
      emit(GetProjectFailed(message: "Error: ${e.toString()}"));
    }
  }
}
