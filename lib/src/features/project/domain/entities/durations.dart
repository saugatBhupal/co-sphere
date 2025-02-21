import 'package:equatable/equatable.dart';

class DurationTime extends Equatable {
  final int from;
  final int to;

  const DurationTime({required this.from, required this.to});

  factory DurationTime.initial() {
    return DurationTime(from: 0, to: 0);
  }

  DurationTime copyWith({
    int? from,
    int? to,
  }) {
    return DurationTime(
      from: from ?? this.from,
      to: to ?? this.to,
    );
  }

  factory DurationTime.fromJson(Map<String, dynamic> json) {
    return DurationTime(
      from: json['from'] as int? ?? 0,
      to: json['to'] as int? ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'from': from,
      'to': to,
    };
  }

  @override
  List<Object> get props => [from, to];
}
