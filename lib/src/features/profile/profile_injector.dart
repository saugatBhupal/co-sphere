import 'package:cosphere/src/config/dependency_injection/dependency_injector.dart';
import 'package:cosphere/src/features/profile/presentation/viewmodels/profile_bloc.dart';

void initProfile() {
  sl.registerFactory<ProfileBloc>(() => ProfileBloc());
}
