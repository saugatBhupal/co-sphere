import 'dart:io';

import 'package:bloc_test/bloc_test.dart';
import 'package:cosphere/src/core/domain/entities/user.dart';
import 'package:cosphere/src/features/profile/data/dto/education/add_education_req_dto.dart';
import 'package:cosphere/src/features/profile/data/dto/experience/add_experience_req_dto.dart';
import 'package:cosphere/src/features/profile/data/dto/experience/get_experience_res_dto.dart';
import 'package:cosphere/src/features/profile/data/dto/profile_img/update_profile_imgage_req_dto.dart';
import 'package:cosphere/src/features/profile/data/models/remote/experience_api_model.dart';
import 'package:cosphere/src/features/profile/domain/entities/education.dart';
import 'package:cosphere/src/features/profile/domain/entities/experience.dart';
import 'package:cosphere/src/features/profile/domain/entities/reviews.dart';
import 'package:cosphere/src/features/profile/domain/entities/skill.dart';
import 'package:cosphere/src/features/profile/domain/usecases/add_education_usecase.dart';
import 'package:cosphere/src/features/profile/domain/usecases/add_experience_usecase.dart';
import 'package:cosphere/src/features/profile/domain/usecases/add_skill_usecase.dart';
import 'package:cosphere/src/features/profile/domain/usecases/get_education_by_userID_usecase.dart';
import 'package:cosphere/src/features/profile/domain/usecases/get_experience_by_userID_usecase.dart';
import 'package:cosphere/src/features/profile/domain/usecases/get_history_by_user_id_usecase.dart';
import 'package:cosphere/src/features/profile/domain/usecases/get_review_by_id_usecase.dart';
import 'package:cosphere/src/features/profile/domain/usecases/get_reviews_by_user_usecase.dart';
import 'package:cosphere/src/features/profile/domain/usecases/get_user_profile_by_id_usecase.dart';
import 'package:cosphere/src/features/profile/domain/usecases/update_intro_usecase.dart';
import 'package:cosphere/src/features/profile/domain/usecases/update_profile_image_usecase.dart';
import 'package:cosphere/src/features/profile/presentation/viewmodels/profile_bloc.dart';
import 'package:cosphere/src/features/project/domain/entities/project.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:uuid/uuid.dart';

import 'profile_viewmodel_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<UpdateProfileImageUsecase>(),
  MockSpec<AddSkillUsecase>(),
  MockSpec<GetEducationByUserIDUsecase>(),
  MockSpec<GetExperienceByUserIDUsecase>(),
  MockSpec<AddEducationUsecase>(),
  MockSpec<AddExperienceUsecase>(),
  MockSpec<UpdateIntroUsecase>(),
  MockSpec<GetUserProfileByIdUsecase>(),
  MockSpec<GetReviewsByUserUsecase>(),
  MockSpec<GetUserReviewByIdUsecase>(),
  MockSpec<GetHistoryByUserIdUsecase>(),
])
void main() {
  group('ProfileViewModel', () {
    late UpdateProfileImageUsecase mockUpdateProfileImageUsecase;
    late AddSkillUsecase mockAddSkillUsecase;
    late GetEducationByUserIDUsecase mockGetEducationByUserIDUsecase;
    late GetExperienceByUserIDUsecase mockGetExperienceByUserIDUsecase;
    late AddEducationUsecase mockAddEducationUsecase;
    late AddExperienceUsecase mockAddExperienceUsecase;
    late UpdateIntroUsecase mockUpdateIntroUsecase;
    late GetUserProfileByIdUsecase mockGetUserProfileByIdUsecase;
    late GetReviewsByUserUsecase mockGetReviewsByUserUsecase;
    late GetUserReviewByIdUsecase mockGetReviewByIdUsecase;
    late GetHistoryByUserIdUsecase mockGetHistoryByUserIdUsecase;
    setUp(() {
      mockUpdateProfileImageUsecase = MockUpdateProfileImageUsecase();
      mockAddSkillUsecase = MockAddSkillUsecase();
      mockGetExperienceByUserIDUsecase = MockGetExperienceByUserIDUsecase();
      mockGetEducationByUserIDUsecase = MockGetEducationByUserIDUsecase();
      mockAddEducationUsecase = MockAddEducationUsecase();
      mockAddExperienceUsecase = MockAddExperienceUsecase();
      mockUpdateIntroUsecase = MockUpdateIntroUsecase();
      mockGetUserProfileByIdUsecase = MockGetUserProfileByIdUsecase();
      mockGetReviewsByUserUsecase = MockGetReviewsByUserUsecase();
      mockGetReviewByIdUsecase = MockGetUserReviewByIdUsecase();
      mockGetHistoryByUserIdUsecase = MockGetHistoryByUserIdUsecase();
    });

    blocTest<ProfileBloc, ProfileState>(
      'emits [MyState] when MyEvent is added.',
      build: () => ProfileBloc(
        updateProfileImageUsecase: mockUpdateProfileImageUsecase,
        addSkillUsecase: mockAddSkillUsecase,
        getEducationByUseridUsecase: mockGetEducationByUserIDUsecase,
        getExperienceByUserIDUsecase: mockGetExperienceByUserIDUsecase,
        addEducationUsecase: mockAddEducationUsecase,
        addExperienceUsecase: mockAddExperienceUsecase,
        updateIntroUsecase: mockUpdateIntroUsecase,
        getUserProfileByIdUsecase: mockGetUserProfileByIdUsecase,
        getReviewsByUserUsecase: mockGetReviewsByUserUsecase,
        getHistoryByUserIdUsecase: mockGetHistoryByUserIdUsecase,
        getReviewByIdUsecase: mockGetReviewByIdUsecase,
      ),
      act: (bloc) async {
        final uid = "123";
        // Update Profile Image
        final testImageFile = File('test_resources/sample_image.jpg');
        final updateProfileImgReqDto = UpdateProfileImgageReqDto(
            media: testImageFile, email: "test@gmail.com");

        when(mockUpdateProfileImageUsecase.call(updateProfileImgReqDto))
            .thenAnswer(
                (_) async => const Right("Profile image updated successfully"));
        bloc.add(UpdateProfileImage(dto: updateProfileImgReqDto));

        // Add Skill
        final skillDto = AddSkillsParams(uid: uid, name: "flutter");
        when(mockAddSkillUsecase.call(skillDto)).thenAnswer((_) async =>
            Right([Skill.initial(), Skill.initial(), Skill.initial()]));
        bloc.add(AddSkill(params: skillDto));

        // Get Education
        when(mockGetEducationByUserIDUsecase(uid))
            .thenAnswer((_) async => Right([
                  Education.initial(),
                  Education.initial(),
                  Education.initial(),
                ]));
        bloc.add(GetEducationByUserID(uid: uid));

        // Get Experience
        final experienceList = [
          ExperienceApiModel(
            id: 'exp1',
            position: 'Software Engineer',
            organization: 'Tech Corp',
            status: 'Intern',
            from: DateTime.now(),
            to: DateTime.now(),
          ),
          ExperienceApiModel(
            id: 'exp2',
            position: 'Backend Developer',
            organization: 'Dev Solutions',
            status: 'Associate',
            from: DateTime.now(),
            to: DateTime.now(),
          ),
        ];
        final GetExperienceResDto resDto = GetExperienceResDto(
          overview: '5 years of experience in software development',
          experience: experienceList,
        );
        when(mockGetExperienceByUserIDUsecase(uid))
            .thenAnswer((_) async => Right(resDto));
        bloc.add(GetExperienceByUserID(uid: uid));

        // Add Education
        final eduDto = AddEducationReqDto(
          email: "test@gmail.com",
          degree: "testDegree",
          organization: "testOrganization",
          from: DateTime.now(),
          to: DateTime.now(),
        );
        when(mockAddEducationUsecase(eduDto))
            .thenAnswer((_) async => Right(Education.initial()));
        bloc.add(AddEducation(dto: eduDto));

        // Add Experience
        final expDto = AddExperienceReqDto(
          email: "test@gmail.com",
          position: "testPosition",
          organization: "testOrganization",
          status: "testStatus",
          from: DateTime.now(),
          to: DateTime.now(),
        );
        when(mockAddExperienceUsecase(expDto))
            .thenAnswer((_) async => Right(Experience.initial()));
        bloc.add(AddExperience(dto: expDto));

        // User Profile
        when(mockGetUserProfileByIdUsecase(uid))
            .thenAnswer((_) async => Right(User.initial()));
        bloc.add(GetUserProfileById(uid: uid));

        // User Reviews
        final reviewId = const Uuid().v4();
        final reviewLst = [Reviews.initial(), Reviews.initial()];
        when(mockGetReviewsByUserUsecase(uid))
            .thenAnswer((_) async => Right(reviewLst));
        bloc.add(GetReviewsByUser(uid: uid));
        // Review by Id
        when(mockGetReviewByIdUsecase(uid))
            .thenAnswer((_) async => Right(reviewLst.first));
        bloc.add(GetReviewById(reviewId: reviewId));
        // Get History
        final projectLst = [Project.initial(), Project.initial()];
        when(mockGetHistoryByUserIdUsecase(uid))
            .thenAnswer((_) async => Right(projectLst));
        bloc.add(GetHistoryByUserId(uid: uid));
      },
      expect: () => [
        isA<UpdatingProfileImage>(),
        isA<UpdateProfileImageSuccess>(),
        isA<AddingSkill>(),
        isA<AddSkillSuccess>(),
        isA<GetProfileInfoLoading>(),
        isA<GetEducationSuccess>(),
        isA<GetProfileInfoLoading>(),
        isA<GetExperienceSuccess>(),
        isA<GetProfileInfoLoading>(),
        isA<AddEducationSuccess>(),
        isA<GetProfileInfoLoading>(),
        isA<AddExperienceSuccess>(),
        isA<GetProfileInfoLoading>(),
        isA<GetReviewByUserLoading>(),
        isA<GetReviewByUserSuccess>(),
        isA<GetReviewByIdLoading>(),
        isA<GetProfileInfoSuccess>(),
        isA<GetReviewByIdFailed>(),
        isA<GetHistoryByUserIdLoading>(),
        isA<GetHistoryByUserIdSuccess>(),
      ],
    );
  });
}
