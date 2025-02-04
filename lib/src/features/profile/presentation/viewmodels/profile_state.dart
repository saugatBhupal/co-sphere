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

class GetEducationSuccess extends ProfileState {
  final List<Education> education;
  const GetEducationSuccess({required this.education});
}

class GetProfileInfoFailed extends ProfileState {
  final String message;

  const GetProfileInfoFailed(this.message);
}

class GetExperienceSuccess extends ProfileState {
  final GetExperienceResponseDto dto;
  const GetExperienceSuccess({required this.dto});
}
