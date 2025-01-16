import 'package:bloc/bloc.dart';
import 'package:cosphere/src/config/app_routes/app_routes.dart';
import 'package:cosphere/src/core/domain/entities/user.dart';
import 'package:cosphere/src/features/authentication/domain/usecases/signup_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final SignupUsecase signupUsecase;

  SignUpBloc({
    required this.signupUsecase,
  }) : super(SignUpInitial()) {
    on<SignUpEvent>((event, emit) async {
      if (event is AuthSignUp) {
        await _signup(event, emit);
      }
      if (event is UpdateSignupParams) {
        await _updateParams(event, emit);
      }
      if (event is NavLocationScreen) {
        await _navLocationScreen(event, emit);
      }
    });
  }

  Future<void> _signup(AuthSignUp event, Emitter<SignUpState> emit) async {
    emit(const AuthSignUpLoading());
    final result = await signupUsecase(event.params);
    result.fold(
      (failure) => emit(AuthSignupError(failure.message)),
      (success) => emit(AuthSignUpSuccess(user: success)),
    );
  }

  _navLocationScreen(NavLocationScreen event, Emitter<SignUpState> emit) {
    Navigator.of(event.context).pushNamed(AppRoutes.location);
  }

  Future<void> _updateParams(
      UpdateSignupParams event, Emitter<SignUpState> emit) async {
    final updatedParams = SignupParams(
      email: event.params.email.isNotEmpty
          ? event.params.email
          : state.params.email,
      name:
          event.params.name.isNotEmpty ? event.params.name : state.params.name,
      phone: event.params.phone.isNotEmpty
          ? event.params.phone
          : state.params.phone,
      dob: event.params.dob.isNotEmpty ? event.params.dob : state.params.dob,
      address: event.params.address.isNotEmpty
          ? event.params.address
          : state.params.address,
      password: event.params.password.isNotEmpty
          ? event.params.password
          : state.params.password,
    );
    emit(state.copyWith(params: updatedParams));
  }
}
