import 'package:bloc/bloc.dart';
import 'package:cosphere/src/features/profile/data/dto/update_profile_img_req_dto.dart/update_profile_imgage_req_dto.dart';
import 'package:cosphere/src/features/profile/domain/entities/skill.dart';
import 'package:cosphere/src/features/profile/domain/usecases/add_skill_usecase.dart';
import 'package:cosphere/src/features/profile/domain/usecases/update_profile_image_usecase.dart';
import 'package:equatable/equatable.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final UpdateProfileImageUsecase updateProfileImageUsecase;
  final AddSkillUsecase addSkillUsecase;
  ProfileBloc({
    required this.updateProfileImageUsecase,
    required this.addSkillUsecase,
  }) : super(ProfileInitial()) {
    on<ProfileEvent>((event, emit) async {
      if (event is ChangeProfileModule) {
        _changeProfileModule(event, emit);
      }
      if (event is UpdateProfileImage) {
        await _updateProfileImage(event, emit);
      }
      if (event is AddSkill) {
        await _addSkill(event, emit);
      }
    });
  }

  void _changeProfileModule(
      ChangeProfileModule event, Emitter<ProfileState> emit) {
    emit(ProfileModuleChanged(event.index));
  }

  Future<void> _updateProfileImage(
      UpdateProfileImage event, Emitter<ProfileState> emit) async {
    emit(UpdatingProfileImage());
    try {
      final result = await updateProfileImageUsecase(event.dto);
      result.fold(
        (failure) => emit(UpdateProfileImageFailed(failure.message)),
        (success) => emit(UpdateProfileImageSuccess(profileImage: success)),
      );
    } catch (e) {
      emit(UpdateProfileImageFailed("Error: ${e.toString()}"));
    }
  }

  Future<void> _addSkill(AddSkill event, Emitter<ProfileState> emit) async {
    emit(AddingSkill());
    try {
      final result = await addSkillUsecase(event.params);
      print("result $result");
      result.fold(
        (failure) => emit(AddSkillFailed(failure.message)),
        (success) => emit(AddSkillSuccess(skills: success)),
      );
    } catch (e) {
      emit(UpdateProfileImageFailed("Error: ${e.toString()}"));
    }
  }
}
