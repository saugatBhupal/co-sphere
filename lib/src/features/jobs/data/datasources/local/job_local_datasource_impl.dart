import 'package:cosphere/src/core/constants/app_boxes.dart';
import 'package:cosphere/src/features/jobs/data/datasources/local/job_local_datasource.dart';
import 'package:cosphere/src/features/jobs/data/models/local/job_hive_model.dart';
import 'package:cosphere/src/features/jobs/data/models/mappers/job_local_mappers.dart';
import 'package:cosphere/src/features/jobs/data/models/remote/job_api_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class JobLocalDatasourceImpl implements JobLocalDatasource {
  @override
  void addAppliedJobs(List<JobApiModel> projects) async {
    var box = await Hive.openBox<JobHiveModel>(AppBoxesName.appliedJobs);
    await box.clear();
    List<JobHiveModel> projectHiveModels =
        projects.map((e) => e.fromApi()).toList();
    for (var project in projectHiveModels) {
      await box.add(project);
    }
  }

  @override
  Future<List<JobHiveModel>> getAppliedJobs() async {
    var box = await Hive.openBox<JobHiveModel>(AppBoxesName.appliedJobs);
    List<JobHiveModel> storedJobs = box.values.toList();
    return storedJobs;
  }
}
