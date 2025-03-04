import 'package:bloc/bloc.dart';
import 'package:cosphere/src/config/app_routes/app_routes.dart';
import 'package:cosphere/src/features/authentication/data/dto/create_password/create_password_request_dto.dart';
import 'package:cosphere/src/features/authentication/data/dto/otp/otp_request_dto.dart';
import 'package:cosphere/src/features/authentication/data/dto/sign_up/sign_up_request_dto.dart';
import 'package:cosphere/src/features/authentication/domain/usecases/create_password_usecase.dart';
import 'package:cosphere/src/features/authentication/domain/usecases/signup_usecase.dart';
import 'package:cosphere/src/features/authentication/domain/usecases/verify_otp_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final SignupUsecase signupUsecase;
  final VerifyOtpUsecase verifyOtpUsecase;
  final CreatePasswordUsecase createPasswordUsecase;

  SignUpBloc({
    required this.signupUsecase,
    required this.verifyOtpUsecase,
    required this.createPasswordUsecase,
  }) : super(SignUpInitial()) {
    on<SignUpEvent>((event, emit) async {
      if (event is AuthSignUp) {
        await _signup(event, emit);
      }
      if (event is UpdateSignUpRequestDto) {
        await _updateParams(event, emit);
      }
      if (event is NavLocationScreen) {
        await _navLocationScreen(event, emit);
      }
      if (event is VerifyOtp) {
        await _verifyOtp(event, emit);
      }
      if (event is CreatePassword) {
        await _createPassword(event, emit);
      }
    });
  }

  Future<void> _signup(AuthSignUp event, Emitter<SignUpState> emit) async {
    emit(const AuthSignUpLoading());
    final result = await signupUsecase(event.params);
    result.fold(
      (failure) => emit(AuthSignupError(failure.message)),
      (success) => emit(AuthSignUpSuccess(message: success)),
    );
  }

  _navLocationScreen(NavLocationScreen event, Emitter<SignUpState> emit) {
    Navigator.of(event.context).pushNamed(AppRoutes.location);
  }

  Future<void> _verifyOtp(VerifyOtp event, Emitter<SignUpState> emit) async {
    emit(const VerifyOtpLoading());
    final result = await verifyOtpUsecase(event.dto);
    result.fold(
      (failure) => emit(VerifyOtpError(failure.message)),
      (success) => emit(VerifyOtpSuccess(message: success)),
    );
  }

  Future<void> _createPassword(
      CreatePassword event, Emitter<SignUpState> emit) async {
    emit(const CreatePasswordLoading());
    final result = await createPasswordUsecase(event.dto);
    result.fold(
      (failure) => emit(CreatePasswordError(failure.message)),
      (success) => emit(CreatePasswordSuccess(message: success)),
    );
  }

  Future<void> _updateParams(
      UpdateSignUpRequestDto event, Emitter<SignUpState> emit) async {
    final currentParams = state is SignUpUpdating
        ? (state as SignUpUpdating).params
        : SignUpRequestDto.initial();
    final updatedParams = SignUpRequestDto(
      email: event.params.email.isNotEmpty
          ? event.params.email
          : currentParams.email,
      fullname: event.params.fullname.isNotEmpty
          ? event.params.fullname
          : currentParams.fullname,
      phone: event.params.phone.isNotEmpty
          ? event.params.phone
          : currentParams.phone,
      dob: event.params.dob != DateTime.utc(2000, 1, 1)
          ? event.params.dob
          : currentParams.dob,
      country: event.params.country.isNotEmpty
          ? event.params.country
          : currentParams.country,
      province: event.params.province.isNotEmpty
          ? event.params.province
          : currentParams.province,
      city:
          event.params.city.isNotEmpty ? event.params.city : currentParams.city,
    );
    emit(SignUpUpdating(params: updatedParams));
  }
}
