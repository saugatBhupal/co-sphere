import 'package:bloc/bloc.dart';
import 'package:cosphere/src/core/domain/entities/user.dart';
import 'package:cosphere/src/features/authentication/data/dto/sign_in/sign_in_request_dto.dart';
import 'package:cosphere/src/features/authentication/domain/usecases/signin_usecase.dart';
import 'package:equatable/equatable.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final SigninUsecase signinUsecase;
  SignInBloc({required this.signinUsecase}) : super(SignInInitial()) {
    on<SignInEvent>((event, emit) async {
      if (event is AuthSignIn) {
        await _signin(event, emit);
      }
    });
  }

  Future<void> _signin(AuthSignIn event, Emitter<SignInState> emit) async {
    emit(const AuthSignInLoading());
    final result = await signinUsecase(event.params);
    result.fold(
      (failure) => emit(AuthSignInError(failure.message)),
      (success) => emit(AuthSignInSuccess(user: success)),
    );
  }
}
