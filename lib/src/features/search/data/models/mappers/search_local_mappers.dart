import 'package:cosphere/src/features/search/data/models/search_api_model.dart';
import 'package:cosphere/src/features/search/data/models/search_hive_model.dart';
import 'package:cosphere/src/features/search/domain/entities/search.dart';

extension SearchHiveModelMappers on SearchHiveModel {
  Search toDomain() => Search.initial().copyWith(
        id: id,
        query: query,
        date: date,
      );
}

extension SearchMappers on Search {
  SearchHiveModel fromDomain() => SearchHiveModel(
        id: id,
        query: query,
        date: date,
      );
}

extension SearchApiExtension on SearchApiModel {
  SearchHiveModel fromApi() => SearchHiveModel(
        id: id,
        query: query,
        date: date,
      );
}
