import 'package:cosphere/src/core/domain/usecases/base_usecase.dart';
import 'package:cosphere/src/core/error/failure.dart';
import 'package:cosphere/src/features/project/domain/entities/project.dart';
import 'package:cosphere/src/features/search/domain/repositories/search_repository.dart';
import 'package:dartz/dartz.dart';

class GetProjectByNameUsecase implements UsecaseWithParams<List<Project>, String> {
  final SearchRepository searchRepository;

  GetProjectByNameUsecase({required this.searchRepository});

  @override
  Future<Either<Failure, List<Project>>> call(String params) {
    return searchRepository.getProjectsByName(params);
  }
}
