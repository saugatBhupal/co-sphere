import 'package:bloc_test/bloc_test.dart';
import 'package:cosphere/src/core/domain/entities/user.dart';
import 'package:cosphere/src/features/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:cosphere/src/features/dashboard/domain/usecases/get_user_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'dashboard_viewmodel_test.mocks.dart';

@GenerateNiceMocks([MockSpec<GetUserUsecase>()])
void main() {
  group('DashboardBloc', () {
    late GetUserUsecase mockGetUserUsecase;

    setUp(() {
      mockGetUserUsecase = MockGetUserUsecase();
    });

    blocTest<DashboardBloc, DashboardState>(
      'emits [DashboardStartupLoading, DashboardGetUserSuccess] when user data is fetched successfully',
      build: () => DashboardBloc(getUserUsecase: mockGetUserUsecase),
      act: (bloc) async {
        final user = User.initial();
        when(mockGetUserUsecase.call()).thenAnswer((_) async => Right(user));
        bloc.add(StartUpAppEvent());
      },
      expect: () => [
        isA<DashboardStartupLoading>(),
        isA<DashboardGetUserSuccess>(),
      ],
    );
  });
}
