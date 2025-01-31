import 'dart:io';

import 'package:cosphere/src/core/functions/file_converter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'update_profile_imgage_req_dto.g.dart';

@JsonSerializable()
class UpdateProfileImgageReqDto {
  @FileConverter()
  final File? media;
  final String email;

  UpdateProfileImgageReqDto({this.media, required this.email});

  factory UpdateProfileImgageReqDto.fromJson(Map<String, dynamic> json) =>
      _$UpdateProfileImgageReqDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateProfileImgageReqDtoToJson(this);
}
