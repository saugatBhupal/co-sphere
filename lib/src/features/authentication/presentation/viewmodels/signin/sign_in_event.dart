part of 'sign_in_bloc.dart';

sealed class SignInEvent extends Equatable {
  const SignInEvent();

  @override
  List<Object> get props => [];
}

class AuthSignIn extends SignInEvent {
  final SigninRequestDto params;

  const AuthSignIn({required this.params});
  @override
  List<Object> get props => [params];
}
