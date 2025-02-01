import 'package:bloc/bloc.dart';
import 'package:cosphere/src/core/domain/entities/user.dart';
import 'package:cosphere/src/features/splash/domain/usecases/get_current_user_usecase.dart';
import 'package:equatable/equatable.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final GetCurrentUserUsecase getCurrentUserUsecase;
  SplashBloc({required this.getCurrentUserUsecase}) : super(SplashInitial()) {
    on<SplashEvent>((event, emit) async {
      if (event is StartUpEvent) {
        await _splashGetCurrentUser(event, emit);
      }
    });
  }

  Future<void> _splashGetCurrentUser(
      StartUpEvent event, Emitter<SplashState> emit) async {
    emit(StartupLoading());
    final result = await getCurrentUserUsecase();
    result.fold(
      (left) => emit(SplashGetUserFailed()),
      (right) => emit(SplashGetUserSuccess(user: right)),
    );
  }
}
