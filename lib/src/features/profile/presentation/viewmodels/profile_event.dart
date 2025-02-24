part of 'profile_bloc.dart';

sealed class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

class ChangeProfileModule extends ProfileEvent {
  final int index;

  const ChangeProfileModule(this.index);
}

class UpdateProfileImage extends ProfileEvent {
  final UpdateProfileImgageReqDto dto;

  const UpdateProfileImage({required this.dto});
}

class AddSkill extends ProfileEvent {
  final AddSkillsParams params;

  const AddSkill({required this.params});
}

class GetEducationByUserID extends ProfileEvent {
  final String uid;

  const GetEducationByUserID({required this.uid});
}

class GetExperienceByUserID extends ProfileEvent {
  final String uid;

  const GetExperienceByUserID({required this.uid});
}

class AddEducation extends ProfileEvent {
  final AddEducationReqDto dto;

  const AddEducation({required this.dto});
}

class AddExperience extends ProfileEvent {
  final AddExperienceReqDto dto;

  const AddExperience({required this.dto});
}

class UpdateIntro extends ProfileEvent {
  final UpdateIntroReqDto dto;

  const UpdateIntro({required this.dto});
}

class GetUserProfileById extends ProfileEvent {
  final String uid;

  const GetUserProfileById({required this.uid});
}

class GetReviewsByUser extends ProfileEvent {
  final String uid;

  const GetReviewsByUser({required this.uid});
}

class GetReviewById extends ProfileEvent {
  final String reviewId;

  const GetReviewById({required this.reviewId});
}
