import 'package:cosphere/src/core/domain/entities/user.dart';
import 'package:cosphere/src/core/domain/usecases/base_usecase.dart';
import 'package:cosphere/src/core/error/failure.dart';
import 'package:cosphere/src/features/dashboard/domain/repositories/dasbboard_repository.dart';
import 'package:dartz/dartz.dart';

class GetUserUsecase implements UsecaseWithoutParams<User?> {
  final DashboardRepository dashboardRepository;

  GetUserUsecase({required this.dashboardRepository});
  @override
  Future<Either<Failure, User?>> call() {
    return dashboardRepository.getCurrentUser();
  }
}
