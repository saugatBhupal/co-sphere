import 'package:cosphere/src/core/domain/entities/user.dart';
import 'package:cosphere/src/core/error/failure.dart';
import 'package:cosphere/src/features/dashboard/domain/repositories/dasbboard_repository.dart';
import 'package:cosphere/src/features/dashboard/domain/usecases/get_user_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'get_user_usecase_test.mocks.dart';

@GenerateMocks([DashboardRepository])
void main() {
  late GetUserUsecase getUserUsecase;
  late MockDashboardRepository mockDashRepository;

  setUp(() {
    mockDashRepository = MockDashboardRepository();
    getUserUsecase = GetUserUsecase(dasboardRepository: mockDashRepository);
  });
  test('should return User when repository call is successful', () async {
    // Arrange
    final user = User.initial().copyWith(
      email: "test@gmail.com",
      fullname: "test user",
      verified: true,
      country: "Nepal",
      phone: "1234567890",
    );
    when(mockDashRepository.getCurrentUser())
        .thenAnswer((_) async => Right(user));

    // Act
    final result = await getUserUsecase.call();

    // Assert
    expect(result, Right(user));
    verify(mockDashRepository.getCurrentUser()).called(1);
    verifyNoMoreInteractions(mockDashRepository);
  });

  test('should return Failure when repository call fails', () async {
    // Arrange
    const failure = Failure(message: "Unable to fetch user");

    when(mockDashRepository.getCurrentUser())
        .thenAnswer((_) async => const Left(failure));

    // Act
    final result = await getUserUsecase.call();

    // Assert
    expect(result, const Left(failure));
    verify(mockDashRepository.getCurrentUser()).called(1);
    verifyNoMoreInteractions(mockDashRepository);
  });
}
