// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_job_req_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateJobReqDto _$CreateJobReqDtoFromJson(Map<String, dynamic> json) =>
    CreateJobReqDto(
      jobName: json['jobName'] as String,
      companyName: json['companyName'] as String,
      position: json['position'] as String,
      address: json['address'] as String,
      postedBy: json['postedBy'] as String,
      skills:
          (json['skills'] as List<dynamic>).map((e) => e as String).toList(),
      site: json['site'] as String,
      salary: Salary.fromJson(json['salary'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CreateJobReqDtoToJson(CreateJobReqDto instance) =>
    <String, dynamic>{
      'jobName': instance.jobName,
      'companyName': instance.companyName,
      'position': instance.position,
      'address': instance.address,
      'postedBy': instance.postedBy,
      'skills': instance.skills,
      'site': instance.site,
      'salary': instance.salary,
    };
