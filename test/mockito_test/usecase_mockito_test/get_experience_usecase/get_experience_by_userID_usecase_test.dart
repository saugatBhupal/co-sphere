import 'package:cosphere/src/features/profile/domain/repositories/profile_repository.dart';
import 'package:cosphere/src/features/profile/domain/usecases/get_experience_by_userID_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';

import 'get_experience_by_userID_usecase_test.mocks.dart';

@GenerateMocks([ProfileRepository])
void main() {
  late MockProfileRepository mockProfileRepository;
  late GetExperienceByUserIDUsecase getExperienceByUserIDUsecase;
  setUp(() {
    mockProfileRepository = MockProfileRepository();
    getExperienceByUserIDUsecase =
        GetExperienceByUserIDUsecase(profileRepository: mockProfileRepository);
  });

  
}
