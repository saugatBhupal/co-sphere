part of 'sign_up_bloc.dart';

sealed class SignUpEvent extends Equatable {
  const SignUpEvent();

  @override
  List<Object> get props => [];
}

class AuthSignUp extends SignUpEvent {
  final SignupParams params;

  const AuthSignUp({required this.params});
  @override
  List<Object> get props => [params];
}
