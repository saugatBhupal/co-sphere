import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:cosphere/src/core/constants/hive_table.dart';

part 'search_hive_model.g.dart';

@HiveType(typeId: HiveTable.searchTableId)
class SearchHiveModel extends Equatable {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String query;
  @HiveField(2)
  final DateTime date;

  const SearchHiveModel({
    required this.id,
    required this.query,
    required this.date,
  });

  @override
  List<Object> get props => [id, query, date];
}
