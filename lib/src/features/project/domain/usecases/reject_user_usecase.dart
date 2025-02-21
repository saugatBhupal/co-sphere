import 'package:cosphere/src/core/domain/usecases/base_usecase.dart';
import 'package:cosphere/src/core/error/failure.dart';
import 'package:cosphere/src/features/project/domain/repositories/project_repository.dart';
import 'package:dartz/dartz.dart';

class RejectUserUsecase implements UsecaseWithParams<String, List<String>> {
  final ProjectRepository projectRepository;

  RejectUserUsecase({required this.projectRepository});

  @override
  Future<Either<Failure, String>> call(List<String> params) {
    return projectRepository.rejectUser(params);
  }
}
