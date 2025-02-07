import 'package:cosphere/src/core/constants/app_enums.dart';
import 'package:cosphere/src/features/authentication/data/dto/create_password/create_password_request_dto.dart';
import 'package:cosphere/src/features/authentication/data/dto/otp/otp_request_dto.dart';
import 'package:cosphere/src/features/authentication/data/dto/sign_up/sign_up_request_dto.dart';
import 'package:cosphere/src/features/authentication/domain/usecases/create_password_usecase.dart';
import 'package:cosphere/src/features/authentication/domain/usecases/signup_usecase.dart';
import 'package:cosphere/src/features/authentication/domain/usecases/verify_otp_usecase.dart';
import 'package:cosphere/src/features/authentication/presentation/viewmodels/bloc/sign_up_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mockito/mockito.dart';
import 'signup_viewmodel_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<SignupUsecase>(),
  MockSpec<VerifyOtpUsecase>(),
  MockSpec<CreatePasswordUsecase>(),
])
void main() {
  group('SignupViewModel', () {
    late SignupUsecase mockSignupUsecase;
    late VerifyOtpUsecase mockVerifyOtpUsecase;
    late CreatePasswordUsecase mockCreatePasswordUsecase;

    setUp(() {
      mockSignupUsecase = MockSignupUsecase();
      mockVerifyOtpUsecase = MockVerifyOtpUsecase();
      mockCreatePasswordUsecase = MockCreatePasswordUsecase();
    });

    blocTest<SignUpBloc, SignUpState>(
      'emits [MyState] when MyEvent is added.',
      build: () => SignUpBloc(
        signupUsecase: mockSignupUsecase,
        verifyOtpUsecase: mockVerifyOtpUsecase,
        createPasswordUsecase: mockCreatePasswordUsecase,
      ),
      act: (bloc) async {
        // Signup
        final signupDto = SignUpRequestDto(
          email: "test@gmail.com",
          fullname: "test name",
          phone: "1234567890",
          dob: DateTime.now(),
          country: "testCountry",
          province: "testProvince",
          city: "testCity",
        );
        when(mockSignupUsecase.call(signupDto))
            .thenAnswer((_) async => const Right("Sign up Success"));
        bloc.add(AuthSignUp(params: signupDto));

        // Verify OTP
        final otpDto = OtpRequestDto(
            type: OtpType.verifyUser, email: "test@gmail.com", otp: "123434");
        when(mockVerifyOtpUsecase.call(otpDto))
            .thenAnswer((_) async => const Right("OTP verification Success"));
        bloc.add(VerifyOtp(dto: otpDto));

        // Create Password
        final passwordDto = CreatePasswordRequestDto(
            email: "test@gmail.com", password: "test@123");
        when(mockCreatePasswordUsecase.call(passwordDto))
            .thenAnswer((_) async => const Right("Password Success"));
        bloc.add(CreatePassword(dto: passwordDto));
      },
      expect: () => [
        isA<AuthSignUpLoading>(),
        isA<AuthSignUpSuccess>(),
        isA<VerifyOtpLoading>(),
        isA<VerifyOtpSuccess>(),
        isA<CreatePasswordLoading>(),
        isA<CreatePasswordSuccess>(),
      ],
    );
  });
}
