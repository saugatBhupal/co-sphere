import 'package:cosphere/src/core/constants/app_boxes.dart';
import 'package:cosphere/src/features/search/data/datasources/local/search_local_datasource.dart';
import 'package:cosphere/src/features/search/data/models/mappers/search_local_mappers.dart';
import 'package:cosphere/src/features/search/data/models/search_api_model.dart';
import 'package:cosphere/src/features/search/data/models/search_hive_model.dart';

class SearchLocalDatasourceImpl implements SearchLocalDatasource {
  @override
  void addSearchHistory(List<SearchApiModel> searches) async {
    await AppBoxes.searchBox.clear();
    List<SearchHiveModel> searchHiveModels =
        searches.map((e) => e.fromApi()).toList();
    for (var search in searchHiveModels) {
      await AppBoxes.searchBox.add(search);
    }
  }

  @override
  Future<List<SearchHiveModel>> getSearchHistory() async {
    List<SearchHiveModel> storedProjects = AppBoxes.searchBox.values.toList();
    return storedProjects;
  }
}
