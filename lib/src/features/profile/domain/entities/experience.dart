import 'package:equatable/equatable.dart';

class Experience extends Equatable {
  final String id;
  final String position;
  final String organization;
  final String status;
  final DateTime from;
  final DateTime to;

  const Experience({
    required this.id,
    required this.position,
    required this.organization,
    required this.status,
    required this.from,
    required this.to,
  });

  factory Experience.initial() {
    return Experience(
      id: '',
      position: '',
      organization: '',
      status: '',
      from: DateTime.utc(2000, 1, 1),
      to: DateTime.utc(2000, 1, 1),
    );
  }
  Experience copywith({
    String? id,
    String? position,
    String? organization,
    String? status,
    DateTime? from,
    DateTime? to,
  }) {
    return Experience(
      id: id ?? this.id,
      position: position ?? this.position,
      organization: organization ?? this.organization,
      status: status ?? this.status,
      from: from ?? this.from,
      to: to ?? this.to,
    );
  }

  @override
  List<Object> get props {
    return [position, organization, status, from, to];
  }
}
