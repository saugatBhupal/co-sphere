import 'package:cosphere/src/features/profile/domain/repositories/profile_repository.dart';
import 'package:cosphere/src/features/profile/domain/usecases/get_education_by_userID_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([ProfileRepository])
void main() {
  late MockProfileRepository mockProfileRepository;
  late GetEducationByUserIDUsecase getEducationByUserIDUsecase;

  setUp(() {
    mockProfileRepository = MockProfileRepository();
    getEducationByUserIDUsecase =
        GetEducationByUserIDUsecase(profileRepository: mockProfileRepository);
  });
}
