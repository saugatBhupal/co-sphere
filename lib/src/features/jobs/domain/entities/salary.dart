import 'package:equatable/equatable.dart';

class Salary extends Equatable {
  final double min;
  final double max;

  const Salary({required this.min, required this.max});

  @override
  List<Object> get props => [min, max];

  factory Salary.initial() {
    return const Salary(
      min: 0.0,
      max: 0.0,
    );
  }

  Salary copyWith({
    double? min,
    double? max,
  }) {
    return Salary(
      min: min ?? this.min,
      max: max ?? this.max,
    );
  }
}
