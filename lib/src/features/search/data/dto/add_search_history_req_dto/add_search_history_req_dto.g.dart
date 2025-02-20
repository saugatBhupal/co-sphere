// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_search_history_req_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddSearchHistoryReqDto _$AddSearchHistoryReqDtoFromJson(
        Map<String, dynamic> json) =>
    AddSearchHistoryReqDto(
      userId: json['userId'] as String,
      query: json['query'] as String,
    );

Map<String, dynamic> _$AddSearchHistoryReqDtoToJson(
        AddSearchHistoryReqDto instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'query': instance.query,
    };
