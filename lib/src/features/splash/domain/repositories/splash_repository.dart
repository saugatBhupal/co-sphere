import 'package:cosphere/src/core/domain/entities/user.dart';
import 'package:cosphere/src/core/error/failure.dart';
import 'package:dartz/dartz.dart';

abstract interface class SplashRepository {
  Future<Either<Failure, User?>> getCurrentUser();
}
