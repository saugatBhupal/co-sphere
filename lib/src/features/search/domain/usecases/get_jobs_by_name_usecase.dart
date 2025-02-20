import 'package:cosphere/src/core/domain/usecases/base_usecase.dart';
import 'package:cosphere/src/core/error/failure.dart';
import 'package:cosphere/src/features/jobs/domain/entities/job.dart';
import 'package:cosphere/src/features/search/domain/repositories/search_repository.dart';
import 'package:dartz/dartz.dart';

class GetJobsByNameUsecase implements UsecaseWithParams<List<Job>, String> {
  final SearchRepository searchRepository;

  GetJobsByNameUsecase({required this.searchRepository});

  @override
  Future<Either<Failure, List<Job>>> call(String params) {
    return searchRepository.getJobsByName(params);
  }
}
