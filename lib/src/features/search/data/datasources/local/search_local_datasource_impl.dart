import 'package:cosphere/src/core/constants/app_boxes.dart';
import 'package:cosphere/src/features/search/data/datasources/local/search_local_datasource.dart';
import 'package:cosphere/src/features/search/data/models/mappers/search_local_mappers.dart';
import 'package:cosphere/src/features/search/data/models/search_api_model.dart';
import 'package:cosphere/src/features/search/data/models/search_hive_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SearchLocalDatasourceImpl implements SearchLocalDatasource {
  @override
  void addSearchHistory(List<SearchApiModel> searches) async {
    var box = await Hive.openBox<SearchHiveModel>(AppBoxesName.searchHistory);
    await box.clear();
    List<SearchHiveModel> searchHiveModels =
        searches.map((e) => e.fromApi()).toList();
    for (var saerch in searchHiveModels) {
      await box.add(saerch);
    }
  }

  @override
  Future<List<SearchHiveModel>> getSearchHistory() async {
    var box = await Hive.openBox<SearchHiveModel>(AppBoxesName.searchHistory);
    List<SearchHiveModel> storedProjects = box.values.toList();
    return storedProjects;
  }
}
