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
