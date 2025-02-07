import 'package:bloc/bloc.dart';
import 'package:cosphere/src/core/domain/entities/user.dart';
import 'package:cosphere/src/features/dashboard/domain/usecases/get_user_usecase.dart';
import 'package:equatable/equatable.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final GetUserUsecase getUserUsecase;
  DashboardBloc({required this.getUserUsecase}) : super(DashboardInitial()) {
    on<DashboardEvent>((event, emit) async {
      if (event is ChangeScreenModule) {
        _changeScreenModule(event, emit);
      }
      if (event is StartUpAppEvent) {
        await _dashboardGetUser(event, emit);
      }
    });
  }

  void _changeScreenModule(
      ChangeScreenModule event, Emitter<DashboardState> emit) {
    emit(ScreenModuleChanged(event.index));
  }

  Future<void> _dashboardGetUser(
      StartUpAppEvent event, Emitter<DashboardState> emit) async {
    emit(DashboardStartupLoading());
    final result = await getUserUsecase();
    result.fold(
      (left) => emit(DashboardGetUserFailed()),
      (right) => emit(DashboardGetUserSuccess(user: right)),
    );
  }
}
