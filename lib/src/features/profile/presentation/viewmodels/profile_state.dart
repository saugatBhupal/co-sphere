part of 'profile_bloc.dart';

sealed class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

final class ProfileInitial extends ProfileState {}

class ProfileModuleChanged extends ProfileState {
  final int index;
  const ProfileModuleChanged(this.index);

  @override
  List<Object> get props => [index];
}

class UpdatingProfileImage extends ProfileState {}

class UpdateProfileImageSuccess extends ProfileState {
  final String profileImage;

  const UpdateProfileImageSuccess({required this.profileImage});
}

class UpdateProfileImageFailed extends ProfileState {
  final String message;

  const UpdateProfileImageFailed(this.message);
}

class AddingSkill extends ProfileState {}

class AddSkillSuccess extends ProfileState {
  final List<Skill> skills;

  const AddSkillSuccess({required this.skills});
}

class AddSkillFailed extends ProfileState {
  final String message;

  const AddSkillFailed(this.message);
}

class GetProfileInfoLoading extends ProfileState {}

class GetProfileInfoSuccess extends ProfileState {
  final User user;
  const GetProfileInfoSuccess({required this.user});
}

class GetEducationSuccess extends ProfileState {
  final List<Education> education;
  const GetEducationSuccess({required this.education});
}

class GetProfileInfoFailed extends ProfileState {
  final String message;

  const GetProfileInfoFailed(this.message);
}

class GetExperienceSuccess extends ProfileState {
  final String overview;
  final List<Experience> experience;
  const GetExperienceSuccess(
      {required this.overview, required this.experience});
}

class AddEducationSuccess extends ProfileState {
  final Education education;
  const AddEducationSuccess({required this.education});
}

class AddExperienceSuccess extends ProfileState {
  final Experience experience;
  const AddExperienceSuccess({required this.experience});
}

class UpdateIntroSuccess extends ProfileState {
  final UpdateIntroResDto resDto;
  const UpdateIntroSuccess({required this.resDto});
}

class GetReviewByIdLoading extends ProfileState {
  const GetReviewByIdLoading();
}

class GetReviewByIdSuccess extends ProfileState {
  final Reviews review;
  const GetReviewByIdSuccess({required this.review});
}

class GetReviewByIdFailed extends ProfileState {
  final String message;
  const GetReviewByIdFailed({required this.message});
}

class GetReviewByUserLoading extends ProfileState {
  const GetReviewByUserLoading();
}

class GetReviewByUserSuccess extends ProfileState {
  final List<Reviews> reviews;
  const GetReviewByUserSuccess({required this.reviews});
}

class GetReviewByUserFailed extends ProfileState {
  final String message;
  const GetReviewByUserFailed({required this.message});
}

class GetHistoryByUserIdLoading extends ProfileState {
  const GetHistoryByUserIdLoading();
}

class GetHistoryByUserIdSuccess extends ProfileState {
  final List<Project> project;
  const GetHistoryByUserIdSuccess({required this.project});
}

class GetHistoryByUserIdFailed extends ProfileState {
  final String message;
  const GetHistoryByUserIdFailed({required this.message});
}
