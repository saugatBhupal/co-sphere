import 'package:bloc/bloc.dart';
import 'package:cosphere/src/core/domain/entities/user.dart';
import 'package:cosphere/src/core/shared_prefs.dart/user_shared_pref.dart';
import 'package:cosphere/src/features/dashboard/domain/usecases/get_user_usecase.dart';
import 'package:equatable/equatable.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final GetUserUsecase getUserUsecase;
  User? cachedUser;
  DashboardBloc({required this.getUserUsecase}) : super(DashboardInitial()) {
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
}
