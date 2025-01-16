part of 'sign_up_bloc.dart';

sealed class SignUpEvent extends Equatable {
  const SignUpEvent();

  @override
  List<Object> get props => [];
}

class AuthSignUp extends SignUpEvent {
  final SignupParams params;

  AuthSignUp({required this.params});
  @override
  List<Object> get props => [params];
}

class UpdateSignupParams extends SignUpEvent {
  final SignupParams params;

  UpdateSignupParams(this.params);

  @override
  List<Object> get props => [params];
}

class NavLocationScreen extends SignUpEvent {
  final BuildContext context;
  final Widget destination;

  const NavLocationScreen({required this.context, required this.destination});
}
