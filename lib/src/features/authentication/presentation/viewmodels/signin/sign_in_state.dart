part of 'sign_in_bloc.dart';

sealed class SignInState extends Equatable {
  const SignInState();

  @override
  List<Object> get props => [];
}

final class SignInInitial extends SignInState {}

class AuthSignInSuccess extends SignInState {
  final User user;
  const AuthSignInSuccess({required this.user});
}

class AuthSignInError extends SignInState {
  final String message;
  const AuthSignInError(this.message);
}

class AuthSignInLoading extends SignInState {
  const AuthSignInLoading();
}
