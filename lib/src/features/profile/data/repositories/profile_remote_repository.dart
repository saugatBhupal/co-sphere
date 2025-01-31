import 'package:cosphere/src/core/error/failure.dart';
import 'package:cosphere/src/features/profile/data/datasources/remote/profile_datasource.dart';
import 'package:cosphere/src/features/profile/data/dto/update_profile_img_req_dto.dart/update_profile_imgage_req_dto.dart';
import 'package:cosphere/src/features/profile/domain/repositories/profile_repository.dart';
import 'package:dartz/dartz.dart';

class ProfileRemoteRepository implements ProfileRepository {
  final ProfileDatasource profileDatasource;

  ProfileRemoteRepository({required this.profileDatasource});
  @override
  Future<Either<Failure, String>> updateProfileImage(
      UpdateProfileImgageReqDto dto) async {
    try {
      final String profileImage =
          await profileDatasource.updateProfileImage(dto);
      return Right(profileImage);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
