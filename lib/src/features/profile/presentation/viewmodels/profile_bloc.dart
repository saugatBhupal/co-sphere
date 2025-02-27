import 'package:bloc/bloc.dart';
import 'package:cosphere/src/core/domain/entities/user.dart';
import 'package:cosphere/src/core/shared_prefs.dart/user_shared_pref.dart';
import 'package:cosphere/src/features/profile/data/dto/education/add_education_req_dto.dart';
import 'package:cosphere/src/features/profile/data/dto/experience/add_experience_req_dto.dart';
import 'package:cosphere/src/features/profile/data/dto/intro/update_intro_req_dto.dart';
import 'package:cosphere/src/features/profile/data/dto/intro/update_intro_res_dto.dart';
import 'package:cosphere/src/features/profile/data/dto/profile_img/update_profile_imgage_req_dto.dart';
import 'package:cosphere/src/features/profile/data/models/mappers/experience_mapper.dart';
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
import 'package:cosphere/src/features/profile/domain/usecases/get_reviews_by_user_usecase.dart';
import 'package:cosphere/src/features/profile/domain/usecases/get_user_profile_by_id_usecase.dart';
import 'package:cosphere/src/features/profile/domain/usecases/update_intro_usecase.dart';
import 'package:cosphere/src/features/profile/domain/usecases/update_profile_image_usecase.dart';
import 'package:cosphere/src/features/project/domain/entities/project.dart';
import 'package:cosphere/src/features/project/domain/usecases/get_review_by_id_usecase.dart';
import 'package:equatable/equatable.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final UpdateProfileImageUsecase updateProfileImageUsecase;
  final AddSkillUsecase addSkillUsecase;
  final GetEducationByUserIDUsecase getEducationByUseridUsecase;
  final GetExperienceByUserIDUsecase getExperienceByUserIDUsecase;
  final AddEducationUsecase addEducationUsecase;
  final AddExperienceUsecase addExperienceUsecase;
  final UpdateIntroUsecase updateIntroUsecase;
  final GetUserProfileByIdUsecase getUserProfileByIdUsecase;
  final GetReviewsByUserUsecase getReviewsByUserUsecase;
  final GetReviewByIdUsecase getReviewByIdUsecase;
  final GetHistoryByUserIdUsecase getHistoryByUserIdUsecase;
  ProfileBloc({
    required this.updateProfileImageUsecase,
    required this.addSkillUsecase,
    required this.getEducationByUseridUsecase,
    required this.getExperienceByUserIDUsecase,
    required this.addEducationUsecase,
    required this.addExperienceUsecase,
    required this.updateIntroUsecase,
    required this.getUserProfileByIdUsecase,
    required this.getReviewByIdUsecase,
    required this.getReviewsByUserUsecase,
    required this.getHistoryByUserIdUsecase,
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
      if (event is GetEducationByUserID) {
        await _getEducationByUserID(event, emit);
      }
      if (event is GetExperienceByUserID) {
        await _getExperienceByUserID(event, emit);
      }
      if (event is AddEducation) {
        await _addEducation(event, emit);
      }
      if (event is AddExperience) {
        await _addExperience(event, emit);
      }
      if (event is UpdateIntro) {
        await _updateIntro(event, emit);
      }
      if (event is GetUserProfileById) {
        await _getUserProfileById(event, emit);
      }
      if (event is GetReviewsByUser) {
        await _getReviewsByUser(event, emit);
      }
      if (event is GetReviewById) {
        await _getReviewById(event, emit);
      }
      if (event is GetHistoryByUserId) {
        await _getHistoryByUserId(event, emit);
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

  List<Education> _education = [];
  List<Education> get education => _education;
  Future<void> _getEducationByUserID(
      GetEducationByUserID event, Emitter<ProfileState> emit) async {
    emit(GetProfileInfoLoading());
    try {
      final result = await getEducationByUseridUsecase(event.uid);
      result.fold((failure) => emit(GetProfileInfoFailed(failure.message)),
          (success) {
        _education = success;
        emit(GetEducationSuccess(education: _education));
      });
    } catch (e) {
      emit(UpdateProfileImageFailed("Error: ${e.toString()}"));
    }
  }

  List<Experience> _experience = [];
  List<Experience> get experience => _experience;
  String overview = "";
  Future<void> _getExperienceByUserID(
      GetExperienceByUserID event, Emitter<ProfileState> emit) async {
    emit(GetProfileInfoLoading());
    try {
      final result = await getExperienceByUserIDUsecase(event.uid);
      result.fold(
        (failure) => emit(GetProfileInfoFailed(failure.message)),
        (success) {
          _experience = success.experience
              .map((experience) => experience.toDomain())
              .toList();
          overview = success.overview!;
          emit(
              GetExperienceSuccess(experience: experience, overview: overview));
        },
      );
    } catch (e) {
      emit(UpdateProfileImageFailed("Error: ${e.toString()}"));
    }
  }

  Future<void> _addEducation(
      AddEducation event, Emitter<ProfileState> emit) async {
    emit(GetProfileInfoLoading());
    try {
      final result = await addEducationUsecase(event.dto);
      result.fold((failure) => emit(GetProfileInfoFailed(failure.message)),
          (data) {
        _education.add(data);
        emit(AddEducationSuccess(education: data));
      });
    } catch (e) {
      emit(UpdateProfileImageFailed("Error: ${e.toString()}"));
    }
  }

  Future<void> _addExperience(
      AddExperience event, Emitter<ProfileState> emit) async {
    emit(GetProfileInfoLoading());
    try {
      final result = await addExperienceUsecase(event.dto);
      result.fold((failure) => emit(GetProfileInfoFailed(failure.message)),
          (data) {
        _experience.add(data);
        print(_experience);
        emit(AddExperienceSuccess(experience: data));
      });
    } catch (e) {
      emit(UpdateProfileImageFailed("Error: ${e.toString()}"));
    }
  }

  Future<void> _updateIntro(
      UpdateIntro event, Emitter<ProfileState> emit) async {
    emit(GetProfileInfoLoading());
    try {
      final result = await updateIntroUsecase(event.dto);
      result.fold(
        (failure) => emit(GetProfileInfoFailed(failure.message)),
        (success) => emit(UpdateIntroSuccess(resDto: success)),
      );
    } catch (e) {
      emit(UpdateProfileImageFailed("Error: ${e.toString()}"));
    }
  }

  User _user = User.initial();
  User get user => _user;
  User? _storedUser = User.initial();
  User? get storedUser => _storedUser;
  Future<void> _getUserProfileById(
      GetUserProfileById event, Emitter<ProfileState> emit) async {
    emit(GetProfileInfoLoading());
    try {
      final result = await getUserProfileByIdUsecase(event.uid);
      _storedUser = await UserSharedPref.getUser();
      result.fold((failure) => emit(GetProfileInfoFailed(failure.message)),
          (success) {
        _user = success;
        emit(GetProfileInfoSuccess(user: success, storedUser: storedUser));
      });
    } catch (e) {
      emit(UpdateProfileImageFailed("Error: ${e.toString()}"));
    }
  }

  Future<void> _getReviewById(
      GetReviewById event, Emitter<ProfileState> emit) async {
    emit(const GetReviewByIdLoading());
    try {
      final result = await getReviewByIdUsecase(event.reviewId);
      result.fold(
        (failure) => emit(GetReviewByIdFailed(message: failure.message)),
        (success) => emit(GetReviewByIdSuccess(review: success)),
      );
    } catch (e) {
      emit(GetReviewByIdFailed(message: "Error: ${e.toString()}"));
    }
  }

  Future<void> _getReviewsByUser(
      GetReviewsByUser event, Emitter<ProfileState> emit) async {
    emit(const GetReviewByUserLoading());
    try {
      final result = await getReviewsByUserUsecase(event.uid);
      result.fold(
        (failure) => emit(GetReviewByUserFailed(message: failure.message)),
        (success) => emit(GetReviewByUserSuccess(reviews: success)),
      );
    } catch (e) {
      emit(GetReviewByUserFailed(message: "Error: ${e.toString()}"));
    }
  }

  Future<void> _getHistoryByUserId(
      GetHistoryByUserId event, Emitter<ProfileState> emit) async {
    emit(const GetHistoryByUserIdLoading());
    try {
      final result = await getHistoryByUserIdUsecase(event.uid);
      result.fold(
        (failure) => emit(GetHistoryByUserIdFailed(message: failure.message)),
        (success) => emit(GetHistoryByUserIdSuccess(project: success)),
      );
    } catch (e) {
      emit(GetHistoryByUserIdFailed(message: "Error: ${e.toString()}"));
    }
  }
}
