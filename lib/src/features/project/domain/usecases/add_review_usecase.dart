import 'package:cosphere/src/core/domain/usecases/base_usecase.dart';
import 'package:cosphere/src/core/error/failure.dart';
import 'package:cosphere/src/features/profile/domain/entities/reviews.dart';
import 'package:cosphere/src/features/project/data/dto/add_review_req_dto.dart';
import 'package:cosphere/src/features/project/domain/repositories/project_repository.dart';
import 'package:dartz/dartz.dart';

class AddReviewUsecase
    implements UsecaseWithParams<List<Reviews>, AddReviewReqDto> {
  final ProjectRepository projectRepository;

  AddReviewUsecase({required this.projectRepository});

  @override
  Future<Either<Failure, List<Reviews>>> call(AddReviewReqDto params) {
    return projectRepository.addReview(params);
  }
}
