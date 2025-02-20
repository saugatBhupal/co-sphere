import 'package:equatable/equatable.dart';
import 'package:cosphere/src/core/constants/app_enums.dart';
import 'package:cosphere/src/core/domain/entities/user.dart';
import 'package:uuid/uuid.dart';

class Applicants extends Equatable {
  final String id;
  final User user;
  final Status status;
  final DateTime date;

  const Applicants({
    required this.id,
    required this.user,
    required this.status,
    required this.date,
  });
  factory Applicants.initial() {
    return Applicants(
      id: const Uuid().v4(),
      user: User.initial(),
      status: Status.pending,
      date: DateTime.now(),
    );
  }

  Applicants copyWith({
    String? id,
    User? user,
    Status? status,
    DateTime? date,
  }) {
    return Applicants(
      id: id ?? this.id,
      user: user ?? this.user,
      status: status ?? this.status,
      date: date ?? this.date,
    );
  }

  @override
  List<Object> get props => [id, user, status, date];
}
