import 'package:bloc_test/bloc_test.dart';
import 'package:cosphere/src/core/domain/entities/user.dart';
import 'package:cosphere/src/features/authentication/data/dto/sign_in/sign_in_request_dto.dart';
import 'package:cosphere/src/features/authentication/domain/usecases/signin_usecase.dart';
import 'package:cosphere/src/features/authentication/presentation/viewmodels/signin/sign_in_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'signin_viewmodel_test.mocks.dart';

@GenerateNiceMocks([MockSpec<SigninUsecase>()])
void main() {
  late SigninUsecase mockSigninUsecase;
  group('SigninViewModel', () {
    setUp(() {
      mockSigninUsecase = MockSigninUsecase();
    });
    blocTest<SignInBloc, SignInState>(
      'emits [MyState] when MyEvent is added.',
      build: () => SignInBloc(signinUsecase: mockSigninUsecase),
      act: (bloc) async {
        // Signup
        const signinDto = SigninRequestDto(
          email: "test@gmail.com",
          password: "testpassword",
        );
        when(mockSigninUsecase.call(signinDto))
            .thenAnswer((_) async => Right(User.initial()));
        bloc.add(const AuthSignIn(params: signinDto));
      },
      expect: () => [
        isA<AuthSignInLoading>(),
        isA<AuthSignInSuccess>(),
      ],
    );
  });
}
