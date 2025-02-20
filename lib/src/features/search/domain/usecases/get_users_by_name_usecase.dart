import 'package:cosphere/src/core/domain/entities/user.dart';
import 'package:cosphere/src/core/domain/usecases/base_usecase.dart';
import 'package:cosphere/src/core/error/failure.dart';
import 'package:cosphere/src/features/search/domain/repositories/search_repository.dart';
import 'package:dartz/dartz.dart';

class GetUsersByNameUsecase implements UsecaseWithParams<List<User>, String> {
  final SearchRepository searchRepository;

  GetUsersByNameUsecase({required this.searchRepository});

  @override
  Future<Either<Failure, List<User>>> call(String params) {
    return searchRepository.getUsersByName(params);
  }
}
