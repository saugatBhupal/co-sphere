part of 'sign_up_bloc.dart';

class SignUpState extends Equatable {
  final SignUpRequestDto params;

  const SignUpState({this.params = const SignUpRequestDto.initial()});

  SignUpState copyWith({SignUpRequestDto? params}) {
    return SignUpState(params: params ?? this.params);
  }

  @override
  List<Object?> get props => [params];
}

final class SignUpInitial extends SignUpState {}

class AuthSignUpSuccess extends SignUpState {
  final String email;

  const AuthSignUpSuccess({required this.email});
}

class AuthSignupError extends SignUpState {
  final String message;
  const AuthSignupError(this.message);
}

class AuthSignUpLoading extends SignUpState {
  const AuthSignUpLoading();
}
