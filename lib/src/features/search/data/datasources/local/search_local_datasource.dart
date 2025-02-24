import 'package:cosphere/src/features/search/data/models/search_api_model.dart';
import 'package:cosphere/src/features/search/data/models/search_hive_model.dart';

abstract class SearchLocalDatasource {
  void addSearchHistory(List<SearchApiModel> searches);
  Future<List<SearchHiveModel>> getSearchHistory();
}
