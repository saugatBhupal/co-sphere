import 'package:bloc/bloc.dart';
import 'package:cosphere/src/features/jobs/domain/entities/applicants.dart';
import 'package:cosphere/src/features/project/data/dto/hire_user_req_dto.dart';
import 'package:cosphere/src/features/project/domain/entities/project.dart';
import 'package:cosphere/src/features/project/domain/usecases/finish_hiring_usecase.dart';
import 'package:cosphere/src/features/project/domain/usecases/get_active_project_user_usecase.dart';
import 'package:cosphere/src/features/project/domain/usecases/get_completed_project_user_usecase.dart';
import 'package:cosphere/src/features/project/domain/usecases/get_hiring_projects_user_usecase.dart';
import 'package:cosphere/src/features/project/domain/usecases/get_project_by_id_usecase.dart';
import 'package:cosphere/src/features/project/domain/usecases/hire_user_usecase.dart';
import 'package:cosphere/src/features/project/domain/usecases/reject_user_usecase.dart';
import 'package:equatable/equatable.dart';

part 'project_event.dart';
part 'project_state.dart';

class ProjectBloc extends Bloc<ProjectEvent, ProjectState> {
  final GetHiringProjectsUserUsecase getHiringProjectsUserUsecase;
  final GetActiveProjectUserUsecase getActiveProjectUserUsecase;
  final GetCompletedProjectUserUsecase getCompletedProjectUserUsecase;
  final GetProjectByIdUsecase getProjectByIdUsecase;
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
    required this.getProjectByIdUsecase,
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
      if (event is GetProjectByID) {
        await _getProjectById(event, emit);
      }
      if (event is HireUser) {
        await _hireUser(event, emit);
      }
      if (event is RejectUser) {
        await _rejectUser(event, emit);
      }
      if (event is FinishHiring) {
        await _finishHiring(event, emit);
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

  List<Applicants> _applicants = [];
  List<Applicants> get applicants => _applicants;
  List<Applicants> _accepted = [];
  List<Applicants> get accepted => _accepted;
  List<Applicants> _rejected = [];
  List<Applicants> get rejected => _rejected;
  Project _project = Project.initial();
  Project get project => _project;
  Future<void> _getProjectById(
      GetProjectByID event, Emitter<ProjectState> emit) async {
    emit(const GetProjectLoading());
    try {
      final result = await getProjectByIdUsecase(event.projectId);
      result.fold((failure) => emit(GetProjectFailed(message: failure.message)),
          (success) {
        _applicants = success.pendingApplicants;
        _accepted = success.acceptedApplicants;
        _rejected = success.rejectedApplicants;
        _project = success;
        emit(GetProjectByIdSuccess(project: _project));
      });
    } catch (e) {
      emit(GetProjectFailed(message: "Error: ${e.toString()}"));
    }
  }

  Future<void> _hireUser(HireUser event, Emitter<ProjectState> emit) async {
    emit(const AcceptingUserLoading());
    try {
      final result = await hireUserUsecase(event.dto);
      result.fold((failure) => emit(HireUserFailed(message: failure.message)),
          (success) {
        Applicants? applicant = _applicants.firstWhere(
          (e) => e.id == success.id,
          orElse: () => _rejected.firstWhere((e) => e.id == success.id),
        );
        if (applicant != null) {
          _applicants.removeWhere((e) => e.id == success.id);
          _rejected.removeWhere((e) => e.id == success.id);
          _accepted.add(applicant);
        }
        emit(HireUserSuccess(project: _project));
      });
    } catch (e) {
      emit(HireUserFailed(message: "Error: ${e.toString()}"));
    }
  }

  Future<void> _rejectUser(RejectUser event, Emitter<ProjectState> emit) async {
    emit(const AcceptingUserLoading());
    try {
      final result = await rejectUserUsecase(event.dto);
      result.fold((failure) => emit(RejectUserFailed(message: failure.message)),
          (success) {
        Applicants? applicant = _applicants.firstWhere(
          (e) => e.id == success.id,
          orElse: () => _accepted.firstWhere((e) => e.id == success.id),
        );
        if (applicant != null) {
          _applicants.removeWhere((e) => e.id == success.id);
          _accepted.removeWhere((e) => e.id == success.id);
          _rejected.add(applicant);
        }
        emit(RejectUserSuccess(applicant: success));
      });
    } catch (e) {
      emit(RejectUserFailed(message: "Error: ${e.toString()}"));
    }
  }

  Future<void> _finishHiring(
      FinishHiring event, Emitter<ProjectState> emit) async {
    emit(const FinishHireLoading());
    try {
      final result = await finishHiringUsecase(event.projectId);
      result.fold(
        (failure) => emit(FinishHireFailed(message: failure.message)),
        (success) => emit(FinishHireSuccess(message: success)),
      );
    } catch (e) {
      emit(GetProjectFailed(message: "Error: ${e.toString()}"));
    }
  }
}
