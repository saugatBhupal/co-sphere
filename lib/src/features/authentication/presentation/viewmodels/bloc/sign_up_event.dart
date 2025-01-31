part of 'sign_up_bloc.dart';

sealed class SignUpEvent extends Equatable {
  const SignUpEvent();

  @override
  List<Object> get props => [];
}

class AuthSignUp extends SignUpEvent {
  final SignUpRequestDto params;

  const AuthSignUp({required this.params});
  @override
  List<Object> get props => [params];
}

class VerifyOtp extends SignUpEvent {
  final OtpRequestDto dto;

  const VerifyOtp({required this.dto});
  @override
  List<Object> get props => [dto];
}

class CreatePassword extends SignUpEvent {
  final CreatePasswordRequestDto dto;

  const CreatePassword({required this.dto});
  @override
  List<Object> get props => [dto];
}

class UpdateSignUpRequestDto extends SignUpEvent {
  final SignUpRequestDto params;

  const UpdateSignUpRequestDto(this.params);
  UpdateSignUpRequestDto copyWith({SignUpRequestDto? params}) {
    return UpdateSignUpRequestDto(
      params ?? this.params,
    );
  }

  @override
  List<Object> get props => [params];
}

class NavLocationScreen extends SignUpEvent {
  final BuildContext context;
  final Widget destination;

  const NavLocationScreen({required this.context, required this.destination});
}
