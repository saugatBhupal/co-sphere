part of 'sign_up_bloc.dart';

sealed class SignUpState extends Equatable {
  const SignUpState();

  @override
  List<Object> get props => [];
}

final class SignUpInitial extends SignUpState {}

class AuthSignUpSuccess extends SignUpState {
  final User user;
  const AuthSignUpSuccess({required this.user});
}

class AuthSignupError extends SignUpState {
  final String message;
  const AuthSignupError(this.message);
}


class AuthSignUpLoading extends SignUpState {
  const AuthSignUpLoading();
}
