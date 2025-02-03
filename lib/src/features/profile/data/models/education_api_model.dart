import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class EducationApiModel extends Equatable {
  @JsonKey(name: '_id')
  final String id;
  final String organization;
  final String degree;
  final DateTime from;
  final DateTime to;

  const EducationApiModel({
    required this.id,
    required this.organization,
    required this.degree,
    required this.from,
    required this.to,
  });
  factory EducationApiModel.fromJson(Map<String, dynamic> json) {
    return EducationApiModel(
      id: json['_id'] as String? ?? '',
      organization: json['organization'] as String? ?? 'Unknown',
      degree: json['degree'] as String? ?? 'Unknown',
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
      'organization': organization,
      'degree': degree,
      'from': from.toIso8601String(),
      'to': to.toIso8601String(),
    };
  }

  @override
  List<Object> get props {
    return [id, organization, degree, from, to];
  }
}
