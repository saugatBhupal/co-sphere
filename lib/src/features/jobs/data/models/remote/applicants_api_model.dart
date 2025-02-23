import 'package:equatable/equatable.dart';
import 'package:cosphere/src/core/constants/app_enums.dart';
import 'package:cosphere/src/core/models/remote/user_api_model.dart';
import 'package:cosphere/src/core/utils/enum_mapper.dart';

class ApplicantsApiModel extends Equatable {
  final String id;
  final UserApiModel user;
  final Status status;
  final DateTime date;

  const ApplicantsApiModel({
    required this.id,
    required this.user,
    required this.status,
    required this.date,
  });

  factory ApplicantsApiModel.fromJson(Map<String, dynamic> json) {
    return ApplicantsApiModel(
      id: json['_id'] as String? ?? '',
      user: json['user'] is Map<String, dynamic>
          ? UserApiModel.fromJson(json['user'] as Map<String, dynamic>)
          : UserApiModel.initial().copyWith(uid: json['user']),
      status: StatusExtension.fromDatabaseValue(json["status"]),
      date: DateTime.parse(json['date'] as String),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user': user.toJson(),
      'status': status.toDatabaseValue(),
      'date': date.toIso8601String(),
    };
  }

  @override
  List<Object> get props => [user, status, date];
}
