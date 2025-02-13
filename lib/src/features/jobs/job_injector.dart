import 'package:cosphere/src/config/dependency_injection/dependency_injector.dart';
import 'package:cosphere/src/features/jobs/presentation/viewmodel/job_bloc.dart';

void initJob() {
  sl.registerFactory<JobBloc>(() => JobBloc());
}
