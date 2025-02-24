import 'package:cosphere/src/core/network/hive_service.dart';
import 'package:cosphere/src/features/dashboard/data/datasources/local/dashboard_local_datasource.dart';

class DashboardLocalDatasourceImpl implements DashboardLocalDatasource {
  final HiveService hiveService;

  DashboardLocalDatasourceImpl({required this.hiveService});
}
