import 'package:bloc/bloc.dart';
import 'package:cosphere/src/core/domain/entities/user.dart';
import 'package:cosphere/src/features/authentication/domain/usecases/signup_usecase.dart';
import 'package:equatable/equatable.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final SignupUsecase signupUsecase;

  SignUpBloc({
    required this.signupUsecase,
  }) : super(SignUpInitial()) {
    on<SignUpEvent>((event, emit) async {
      if (event is AuthSignUp) {
        await _signup(event, emit);
      }
    });
  }

  Future<void> _signup(AuthSignUp event, Emitter<SignUpState> emit) async {
    emit(const AuthSignUpLoading());
    final result = await signupUsecase(event.params);
    result.fold(
      (failure) => emit(AuthSignupError(failure.message)),
      (success) => emit(AuthSignUpSuccess(user: success)),
    );
  }
}
