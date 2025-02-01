import 'package:cosphere/src/core/domain/entities/user.dart';
import 'package:cosphere/src/core/domain/usecases/base_usecase.dart';
import 'package:cosphere/src/core/error/failure.dart';
import 'package:cosphere/src/features/splash/domain/repositories/splash_repository.dart';
import 'package:dartz/dartz.dart';

class GetCurrentUserUsecase implements UsecaseWithoutParams<User?> {
  final SplashRepository splashRepository;

  GetCurrentUserUsecase({required this.splashRepository});
  @override
  Future<Either<Failure, User?>> call() {
    return splashRepository.getCurrentUser();
  }
}
