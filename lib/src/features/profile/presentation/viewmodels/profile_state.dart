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
