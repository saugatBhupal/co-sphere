import 'package:cosphere/src/core/error/failure.dart';
import 'package:dartz/dartz.dart';

abstract interface class UsecaseWithParams<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

abstract interface class UsecaseWithoutParams<Type> {
  Future<Either<Failure, Type>> call();
}
  