import 'package:cosphere/src/core/constants/app_enums.dart';
import 'package:cosphere/src/core/domain/entities/user.dart';

class Applicants {
  final User user;
  final Status status;
  final DateTime date;

  Applicants({
    required this.user,
    required this.status,
    required this.date,
  });
  factory Applicants.initial() {
    return Applicants(
      user: User.initial(),
      status: Status.pending,
      date: DateTime.now(),
    );
  }

  Applicants copyWith({
    User? user,
    Status? status,
    DateTime? date,
  }) {
    return Applicants(
      user: user ?? this.user,
      status: status ?? this.status,
      date: date ?? this.date,
    );
  }
}
