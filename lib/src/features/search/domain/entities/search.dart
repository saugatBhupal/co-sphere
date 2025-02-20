import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

class Search extends Equatable {
  final String id;
  final String query;
  final DateTime date;

  const Search({required this.id, required this.query, required this.date});

  @override
  List<Object> get props => [id, query, date];

  factory Search.initial() {
    return Search(
      id: const Uuid().v4(),
      query: "",
      date: DateTime.timestamp(),
    );
  }

  Search copyWith({
    String? id,
    String? query,
    DateTime? date,
  }) {
    return Search(
      id: id ?? this.id,
      query: query ?? this.query,
      date: date ?? this.date,
    );
  }
}
