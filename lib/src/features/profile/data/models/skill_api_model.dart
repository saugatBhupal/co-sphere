import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class SkillApiModel extends Equatable {
  @JsonKey(name: '_id')
  final String uid;
  final String name;

  const SkillApiModel({required this.uid, required this.name});

  factory SkillApiModel.fromJson(Map<String, dynamic> json) {
    return SkillApiModel(
      uid: json['_id'] as String? ?? '',
      name: json['fullname'] as String? ?? 'Unknown',
    );
  }
  Map<String, dynamic> toJson() {
    return {'_id': uid, 'name': name};
  }

  @override
  List<Object?> get props => [uid, name];
}
