import 'package:cosphere/src/config/dependency_injection/dependency_injector.dart';
import 'package:cosphere/src/features/dashboard/presentation/bloc/dashboard_bloc.dart';

void initDash() {
  sl.registerFactory<DashboardBloc>(() => DashboardBloc());
}
