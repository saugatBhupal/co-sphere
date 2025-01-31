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
