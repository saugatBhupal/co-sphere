import 'package:cosphere/src/core/error/failure.dart';
import 'package:cosphere/src/core/http/api_endpoints.dart';
import 'package:cosphere/src/core/http/handle_error_response.dart';
import 'package:cosphere/src/features/profile/data/datasources/remote/profile_datasource.dart';
import 'package:cosphere/src/features/profile/data/dto/update_profile_img_req_dto.dart/update_profile_imgage_req_dto.dart';
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
        print("werhkshfshfs ${res.data["data"]["profileImage"]}");
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
}
