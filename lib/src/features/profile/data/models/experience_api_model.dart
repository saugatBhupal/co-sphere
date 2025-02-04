import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class ExperienceApiModel extends Equatable {
  @JsonKey(name: '_id')
  final String id;
  final String position;
  final String organization;
  final String status;
  final DateTime from;
  final DateTime to;

  const ExperienceApiModel({
    required this.id,
    required this.position,
    required this.organization,
    required this.status,
    required this.from,
    required this.to,
  });
  factory ExperienceApiModel.fromJson(Map<String, dynamic> json) {
    return ExperienceApiModel(
      id: json['_id'] as String? ?? '',
      position: json['position'] as String? ?? 'Unknown',
      organization: json['organization'] as String? ?? 'Unknown',
      status: json['status'] as String? ?? 'Unknown',
      from: json['from'] != null
          ? DateTime.parse(json['from'])
          : DateTime(1970, 1, 1),
      to: json['to'] != null
          ? DateTime.parse(json['to'])
          : DateTime(1970, 1, 1),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'position': position,
      'organization': organization,
      'status': status,
      'from': from.toIso8601String(),
      'to': to.toIso8601String(),
    };
  }

  @override
  List<Object> get props {
    return [id, organization, status, position, from, to];
  }
}
