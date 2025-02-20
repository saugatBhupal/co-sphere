import 'package:equatable/equatable.dart';

class Durations extends Equatable {
  final int from;
  final int to;

  Durations({required this.from, required this.to});

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

  @override
  List<Object> get props => [from, to];
}
