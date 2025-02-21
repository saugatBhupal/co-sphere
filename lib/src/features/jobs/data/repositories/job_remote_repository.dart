import 'package:cosphere/src/features/jobs/data/datasources/remote/job_remote_datasource.dart';
import 'package:cosphere/src/features/jobs/domain/repositories/job_repository.dart';

class JobRemoteRepository implements JobRepository {
  final JobRemoteDatasource datasource;

  JobRemoteRepository({required this.datasource});
}
