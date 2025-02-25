import 'package:cosphere/src/core/error/failure.dart';
import 'package:cosphere/src/core/http/api_endpoints.dart';
import 'package:cosphere/src/core/http/handle_error_response.dart';
import 'package:cosphere/src/core/models/remote/user_api_model.dart';
import 'package:cosphere/src/features/profile/data/datasources/remote/profile_datasource.dart';
import 'package:cosphere/src/features/profile/data/dto/education/add_education_req_dto.dart';
import 'package:cosphere/src/features/profile/data/dto/experience/add_experience_req_dto.dart';
import 'package:cosphere/src/features/profile/data/dto/experience/get_experience_res_dto.dart';
import 'package:cosphere/src/features/profile/data/dto/intro/update_intro_req_dto.dart';
import 'package:cosphere/src/features/profile/data/dto/intro/update_intro_res_dto.dart';
import 'package:cosphere/src/features/profile/data/dto/profile_img/update_profile_imgage_req_dto.dart';
import 'package:cosphere/src/features/profile/data/models/remote/education_api_model.dart';
import 'package:cosphere/src/features/profile/data/models/remote/experience_api_model.dart';
import 'package:cosphere/src/features/profile/data/models/remote/reviews_api_model.dart';
import 'package:cosphere/src/features/profile/data/models/remote/skill_api_model.dart';
import 'package:cosphere/src/features/profile/domain/usecases/add_skill_usecase.dart';
import 'package:cosphere/src/features/project/data/models/remote/project_api_model.dart';
import 'package:dio/dio.dart';

class ProfileDatasourceImpl implements ProfileDatasource {
  final Dio dio;

  ProfileDatasourceImpl({required this.dio});
  @override
  Future<String> updateProfileImage(UpdateProfileImgageReqDto dto) async {
    try {
      FormData imageData = FormData();
      String fileName =
          dto.media != null ? dto.media!.path.split('/').last : '';
      imageData.fields.add(MapEntry('email', dto.email));
      if (dto.media != null) {
        print("Media path: ${dto.media!.path}");
      } else {
        print("No media file provided");
      }
      if (dto.media != null) {
        imageData.files.add(MapEntry(
          'media',
          await MultipartFile.fromFile(
            dto.media!.path,
            filename: fileName,
          ),
        ));
      }
      var res =
          await dio.post(ApiEndpoints.updateProfileImage, data: imageData);
      if (res.statusCode == 200) {
        return res.data["data"]["profileImage"];
      } else {
        throw Failure(
          message: res.statusMessage.toString(),
          statusCode: res.statusCode.toString(),
        );
      }
    } on DioException catch (e) {
      return await handleErrorResponse(e);
    }
  }

  @override
  Future<List<SkillApiModel>> addSkill(AddSkillsParams params) async {
    try {
      var res = await dio.post(
        "${ApiEndpoints.addSkill}${params.uid}",
        data: {'name': params.name},
      );
      if (res.statusCode == 200) {
        var skillsList = res.data['data']['skills'] as List;
        return skillsList
            .map((skill) => SkillApiModel.fromJson(skill))
            .toList();
      } else {
        throw Failure(
          message: res.statusMessage.toString(),
          statusCode: res.statusMessage.toString(),
        );
      }
    } on DioException catch (e) {
      return await handleErrorResponse(e);
    }
  }

  @override
  Future<List<EducationApiModel>> getEducationByUserID(String uid) async {
    try {
      final res = await dio.get("${ApiEndpoints.userEducation}/$uid");
      if (res.statusCode == 200) {
        var educationList = res.data['data']['education'] as List;
        return educationList
            .map((education) => EducationApiModel.fromJson(education))
            .toList();
      } else {
        throw Failure(
          message: res.statusMessage.toString(),
          statusCode: res.statusCode.toString(),
        );
      }
    } on DioException catch (e) {
      return await handleErrorResponse(e);
    }
  }

  @override
  Future<GetExperienceResDto> getExperienceByUserID(String uid) async {
    try {
      final res = await dio.get("${ApiEndpoints.userExperience}/$uid");
      if (res.statusCode == 200) {
        final GetExperienceResDto responseDto =
            GetExperienceResDto.fromJson(res.data);
        return responseDto;
      } else {
        throw Failure(
          message: res.statusMessage.toString(),
          statusCode: res.statusCode.toString(),
        );
      }
    } on DioException catch (e) {
      return await handleErrorResponse(e);
    }
  }

  @override
  Future<EducationApiModel> addEducation(AddEducationReqDto dto) async {
    try {
      var res = await dio.post(ApiEndpoints.userEducation, data: dto.toJson());
      if (res.statusCode == 200) {
        EducationApiModel education =
            EducationApiModel.fromJson(res.data['data']['education']);
        return education;
      } else {
        throw Failure(
          message: res.statusMessage.toString(),
          statusCode: res.statusCode.toString(),
        );
      }
    } on DioException catch (e) {
      return await handleErrorResponse(e);
    }
  }

  @override
  Future<ExperienceApiModel> addExperience(AddExperienceReqDto dto) async {
    try {
      var res = await dio.post(ApiEndpoints.userExperience, data: dto.toJson());
      if (res.statusCode == 200) {
        ExperienceApiModel experience =
            ExperienceApiModel.fromJson(res.data['data']['experience']);
        return experience;
      } else {
        throw Failure(
          message: res.statusMessage.toString(),
          statusCode: res.statusCode.toString(),
        );
      }
    } on DioException catch (e) {
      return await handleErrorResponse(e);
    }
  }

  @override
  Future<UpdateIntroResDto> updateIntro(UpdateIntroReqDto dto) async {
    try {
      var res = await dio.put(ApiEndpoints.updateIntro, data: dto.toJson());
      if (res.statusCode == 200) {
        UpdateIntroResDto updateIntroResDto =
            UpdateIntroResDto.fromJson(res.data['data']['intro']);
        return updateIntroResDto;
      } else {
        throw Failure(
          message: res.statusMessage.toString(),
          statusCode: res.statusCode.toString(),
        );
      }
    } on DioException catch (e) {
      return await handleErrorResponse(e);
    }
  }

  @override
  Future<UserApiModel> getUserProfileById(String uid) async {
    try {
      final res = await dio.get("${ApiEndpoints.user}$uid");
      if (res.statusCode == 200) {
        final data = res.data['data'];
        final UserApiModel userApiModel = UserApiModel.fromJson(data);
        return userApiModel;
      } else {
        throw Failure(
          message: res.statusMessage.toString(),
          statusCode: res.statusCode.toString(),
        );
      }
    } on DioException catch (e) {
      return await handleErrorResponse(e);
    }
  }

  @override
  Future<List<ReviewsApiModel>> getReviewsByUser(String reviewId) async {
    try {
      final res = await dio.get("${ApiEndpoints.user}$reviewId/reviews");
      if (res.statusCode == 200) {
        final List<dynamic> data = res.data['reviews'];
        return data
            .map((review) => ReviewsApiModel.initial().copyWith(id: review))
            .toList();
      } else {
        throw Failure(
          message: res.statusMessage.toString(),
          statusCode: res.statusCode.toString(),
        );
      }
    } on DioException catch (e) {
      return await handleErrorResponse(e);
    }
  }

  @override
  Future<ReviewsApiModel> getReviewById(String reviewId) async {
    try {
      var res = await dio.get("${ApiEndpoints.review}/$reviewId");
      if (res.statusCode == 200) {
        return ReviewsApiModel.fromJson(res.data);
      } else {
        throw Failure(
          message: res.statusMessage.toString(),
          statusCode: res.statusMessage.toString(),
        );
      }
    } on DioException catch (e) {
      return await handleErrorResponse(e);
    }
  }

  @override
  Future<List<ProjectApiModel>> getHistoryByUserId(String uid) async {
    try {
      var res = await dio
          .get("${ApiEndpoints.user}${"67b3ee32ddfc4ad8dd34e185"}/history");
      if (res.statusCode == 200) {
        return (res.data as List)
            .map((json) => ProjectApiModel.fromJson(json))
            .toList();
      } else {
        throw Failure(
          message: res.statusMessage.toString(),
          statusCode: res.statusMessage.toString(),
        );
      }
    } on DioException catch (e) {
      return await handleErrorResponse(e);
    }
  }
}
