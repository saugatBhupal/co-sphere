import 'package:cosphere/src/features/jobs/data/datasources/remote/job_remote_datasource.dart';
import 'package:dio/dio.dart';

class JobRemoteDatasourceImpl implements JobRemoteDatasource {
  final Dio dio;

  JobRemoteDatasourceImpl({required this.dio});
}
