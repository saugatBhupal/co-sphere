import 'package:bloc/bloc.dart';
import 'package:cosphere/src/core/domain/entities/user.dart';
import 'package:cosphere/src/core/shared_prefs.dart/user_shared_pref.dart';
import 'package:cosphere/src/features/dashboard/domain/usecases/get_projects_user_usecase.dart';
import 'package:cosphere/src/features/dashboard/domain/usecases/get_user_usecase.dart';
import 'package:cosphere/src/features/project/domain/entities/project.dart';
import 'package:equatable/equatable.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final GetUserUsecase getUserUsecase;
  final GetProjectsUserUsecase getProjectsUserUsecase;
  User? cachedUser;
  DashboardBloc({
    required this.getUserUsecase,
    required this.getProjectsUserUsecase,
  }) : super(DashboardInitial()) {
    on<DashboardEvent>((event, emit) async {
      if (event is ChangeScreenModule) {
        _changeScreenModule(event, emit);
      }
      if (event is StartUpAppEvent) {
        await _dashboardGetUser(event, emit);
      }
      if (event is LoadUserEvent) {
        await _loadUserEvent(event, emit);
      }
      if (event is GetProjectByUser) {
        await _getProjectByUser(event, emit);
      }
    });
  }

  void _changeScreenModule(
      ChangeScreenModule event, Emitter<DashboardState> emit) {
    emit(ScreenModuleChanged(event.index));
  }

  Future<void> _dashboardGetUser(
      StartUpAppEvent event, Emitter<DashboardState> emit) async {
    if (cachedUser != null) {
      emit(DashboardGetUserSuccess(user: cachedUser!));
      return;
    }
    emit(DashboardStartupLoading());
    final result = await getUserUsecase();

    result.fold((left) => emit(DashboardGetUserFailed(message: left.message)),
        (right) {
      cachedUser = right;
      emit(DashboardGetUserSuccess(user: right));
    });
  }

  Future<void> _loadUserEvent(
      LoadUserEvent event, Emitter<DashboardState> emit) async {
    if (cachedUser != null) {
      emit(DashboardGetCacheUserSuccess(user: cachedUser!));
      return;
    }
    try {
      final user = await UserSharedPref.getUser();
      if (user != null) {
        cachedUser = user;
        emit(DashboardGetCacheUserSuccess(user: user));
      } else {
        emit(const DashboardGetUserFailed(message: "User not found"));
      }
    } catch (e) {
      emit(DashboardGetUserFailed(message: "Failed to load user: $e"));
    }
  }

  List<Project> _createdProjects = [];
  List<Project> get createdProjects => _createdProjects;
  Future<void> _getProjectByUser(
      GetProjectByUser event, Emitter<DashboardState> emit) async {
    emit(const GetProjectByUserLoading());
    try {
      final result = await getProjectsUserUsecase(event.uid);
      result.fold(
          (failure) => emit(GetProjectByUserFailed(message: failure.message)),
          (success) {
        _createdProjects =
            success.length >= 3 ? success.take(3).toList() : success;
        emit(GetProjectByUserSuccess(projects: _createdProjects));
      });
    } catch (e) {
      emit(GetProjectByUserFailed(message: "Error: ${e.toString()}"));
    }
  }
}
