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
