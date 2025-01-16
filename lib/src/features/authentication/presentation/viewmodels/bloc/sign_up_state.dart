part of 'sign_up_bloc.dart';

class SignUpState extends Equatable {
  final SignupParams params;

  const SignUpState({this.params = const SignupParams.initial()});

  SignUpState copyWith({SignupParams? params}) {
    return SignUpState(params: params ?? this.params);
  }

  @override
  List<Object?> get props => [params];
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
