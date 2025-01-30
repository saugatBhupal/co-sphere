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

class VerifyOtpLoading extends SignUpState {
  const VerifyOtpLoading();
}

class VerifyOtpSuccess extends SignUpState {
  final String message;
  const VerifyOtpSuccess({required this.message});
}

class VerifyOtpError extends SignUpState {
  final String message;
  const VerifyOtpError(this.message);
}

class CreatePasswordLoading extends SignUpState {
  const CreatePasswordLoading();
}

class CreatePasswordSuccess extends SignUpState {
  final String message;
  const CreatePasswordSuccess({required this.message});
}

class CreatePasswordError extends SignUpState {
  final String message;
  const CreatePasswordError(this.message);
}
