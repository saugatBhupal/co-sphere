import 'package:cosphere/src/core/domain/usecases/base_usecase.dart';
import 'package:cosphere/src/core/error/failure.dart';
import 'package:cosphere/src/features/project/domain/repositories/project_repository.dart';
import 'package:dartz/dartz.dart';

class FinishHiringUsecase implements UsecaseWithParams<String, String> {
  final ProjectRepository projectRepository;

  FinishHiringUsecase({required this.projectRepository});

  @override
  Future<Either<Failure, String>> call(String params) {
    return projectRepository.finishHiring(params);
  }
}
