import 'package:cosphere/src/features/search/data/models/search_api_model.dart';
import 'package:cosphere/src/features/search/domain/entities/search.dart';

extension SearchApiModelMappers on SearchApiModel {
  Search toDomain() => Search.initial().copyWith(
        id: id,
        query: query,
        date: date,
      );
}

extension SearchMappers on Search {
  SearchApiModel fromDomain() => SearchApiModel(
        id: id,
        query: query,
        date: date,
      );
}
