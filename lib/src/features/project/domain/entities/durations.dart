import 'package:equatable/equatable.dart';

class Durations extends Equatable {
  final int from;
  final int to;

  const Durations({required this.from, required this.to});

  factory Durations.initial() {
    return Durations(from: 0, to: 0);
  }

  Durations copyWith({
    int? from,
    int? to,
  }) {
    return Durations(
      from: from ?? this.from,
      to: to ?? this.to,
    );
  }

  factory Durations.fromJson(Map<String, dynamic> json) {
    return Durations(
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
