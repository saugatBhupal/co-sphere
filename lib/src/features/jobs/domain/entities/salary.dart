import 'package:equatable/equatable.dart';

class Salary extends Equatable {
  final int min;
  final int max;

  const Salary({required this.min, required this.max});

  @override
  List<Object> get props => [min, max];

  factory Salary.initial() {
    return const Salary(
      min: 0,
      max: 0,
    );
  }

  Salary copyWith({
    int? min,
    int? max,
  }) {
    return Salary(
      min: min ?? this.min,
      max: max ?? this.max,
    );
  }

  factory Salary.fromJson(Map<String, dynamic> json) {
    return Salary(
      min: json['min'] as int,
      max: json['max'] as int,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'min': min,
      'max': max,
    };
  }
}
