import 'package:equatable/equatable.dart';

class Education extends Equatable {
  final String id;
  final String organization;
  final String degree;
  final DateTime from;
  final DateTime to;

  const Education({
    required this.id,
    required this.organization,
    required this.degree,
    required this.from,
    required this.to,
  });
  factory Education.initial() {
    return Education(
      id: '',
      organization: '',
      degree: '',
      from: DateTime.utc(2000, 1, 1),
      to: DateTime.utc(2000, 1, 1),
    );
  }
  Education copywith({
    String? id,
    String? organization,
    String? degree,
    DateTime? from,
    DateTime? to,
  }) {
    return Education(
      id: id ?? this.id,
      organization: organization ?? this.organization,
      degree: degree ?? this.degree,
      from: from ?? this.from,
      to: to ?? this.to,
    );
  }

  @override
  List<Object> get props {
    return [id, organization, degree, from, to];
  }
}
