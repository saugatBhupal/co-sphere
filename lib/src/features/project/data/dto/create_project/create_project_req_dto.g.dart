// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_project_req_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateProjectReqDto _$CreateProjectReqDtoFromJson(Map<String, dynamic> json) =>
    CreateProjectReqDto(
      projectName: json['projectName'] as String,
      companyName: json['companyName'] as String,
      position: json['position'] as String,
      address: json['address'] as String,
      postedBy: json['postedBy'] as String,
      skills:
          (json['skills'] as List<dynamic>).map((e) => e as String).toList(),
      site: json['site'] as String,
      salary: Salary.fromJson(json['salary'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CreateProjectReqDtoToJson(
        CreateProjectReqDto instance) =>
    <String, dynamic>{
      'projectName': instance.projectName,
      'companyName': instance.companyName,
      'position': instance.position,
      'address': instance.address,
      'postedBy': instance.postedBy,
      'skills': instance.skills,
      'site': instance.site,
      'salary': instance.salary,
    };
