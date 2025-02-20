import 'package:equatable/equatable.dart';

class SearchApiModel extends Equatable {
  final String id;
  final String query;
  final DateTime date;

  const SearchApiModel({
    required this.id,
    required this.query,
    required this.date,
  });

  factory SearchApiModel.fromJson(Map<String, dynamic> json) {
    return SearchApiModel(
      id: json['_id'] as String? ?? '',
      query: json['query'] as String? ?? '',
      date: DateTime.parse(json['date'] as String),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'query': query,
      'date': date.toIso8601String(),
    };
  }

  @override
  List<Object> get props => [id, query, date];
}
