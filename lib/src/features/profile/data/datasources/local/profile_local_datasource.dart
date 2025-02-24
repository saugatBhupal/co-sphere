import 'package:cosphere/src/features/profile/data/models/local/education/education_hive_model.dart';
import 'package:cosphere/src/features/profile/data/models/local/experience/experience_hive_model.dart';
import 'package:cosphere/src/features/profile/data/models/remote/education_api_model.dart';
import 'package:cosphere/src/features/profile/data/models/remote/experience_api_model.dart';

abstract class ProfileLocalDatasource {
  void addExperience(List<ExperienceApiModel> experience);
  Future<List<ExperienceHiveModel>> getExperience();
  void addEducation(List<EducationApiModel> education);
  Future<List<EducationHiveModel>> getEducation();
}
