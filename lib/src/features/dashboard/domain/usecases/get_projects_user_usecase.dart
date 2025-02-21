import 'package:cosphere/src/core/domain/usecases/base_usecase.dart';
import 'package:cosphere/src/core/error/failure.dart';
import 'package:cosphere/src/features/dashboard/domain/repositories/dasbboard_repository.dart';
import 'package:cosphere/src/features/project/domain/entities/project.dart';
import 'package:dartz/dartz.dart';

class GetProjectsUserUsecase
    implements UsecaseWithParams<List<Project>, String> {
  final DashboardRepository dashboardRepository;

  GetProjectsUserUsecase({required this.dashboardRepository});

  @override
  Future<Either<Failure, List<Project>>> call(String params) {
    return dashboardRepository.getProjectsByUser(params);
  }
}
