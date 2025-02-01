import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc() : super(DashboardInitial()) {
    on<DashboardEvent>((event, emit) async {
      if (event is ChangeScreenModule) {
        _changeScreenModule(event, emit);
      }
    });
  }

  void _changeScreenModule(
      ChangeScreenModule event, Emitter<DashboardState> emit) {
    emit(ScreenModuleChanged(event.index));
  }
}
