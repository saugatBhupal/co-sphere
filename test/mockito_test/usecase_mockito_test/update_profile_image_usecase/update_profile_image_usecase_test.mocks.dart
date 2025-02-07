// Mocks generated by Mockito 5.4.4 from annotations
// in cosphere/test/mockito_test/usecase_mockito_test/update_profile_image_usecase/update_profile_image_usecase_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:cosphere/src/core/error/failure.dart' as _i5;
import 'package:cosphere/src/features/profile/data/dto/education/add_education_req_dto.dart'
    as _i11;
import 'package:cosphere/src/features/profile/data/dto/experience/add_experience_req_dto.dart'
    as _i13;
import 'package:cosphere/src/features/profile/data/dto/experience/get_experience_res_dto.dart'
    as _i10;
import 'package:cosphere/src/features/profile/data/dto/profile_img/update_profile_imgage_req_dto.dart'
    as _i6;
import 'package:cosphere/src/features/profile/domain/entities/education.dart'
    as _i9;
import 'package:cosphere/src/features/profile/domain/entities/experience.dart'
    as _i12;
import 'package:cosphere/src/features/profile/domain/entities/skill.dart'
    as _i7;
import 'package:cosphere/src/features/profile/domain/repositories/profile_repository.dart'
    as _i3;
import 'package:cosphere/src/features/profile/domain/usecases/add_skill_usecase.dart'
    as _i8;
import 'package:dartz/dartz.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeEither_0<L, R> extends _i1.SmartFake implements _i2.Either<L, R> {
  _FakeEither_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [ProfileRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockProfileRepository extends _i1.Mock implements _i3.ProfileRepository {
  MockProfileRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Either<_i5.Failure, String>> updateProfileImage(
          _i6.UpdateProfileImgageReqDto? dto) =>
      (super.noSuchMethod(
        Invocation.method(
          #updateProfileImage,
          [dto],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.Failure, String>>.value(
            _FakeEither_0<_i5.Failure, String>(
          this,
          Invocation.method(
            #updateProfileImage,
            [dto],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, String>>);

  @override
  _i4.Future<_i2.Either<_i5.Failure, List<_i7.Skill>>> addSkill(
          _i8.AddSkillsParams? params) =>
      (super.noSuchMethod(
        Invocation.method(
          #addSkill,
          [params],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.Failure, List<_i7.Skill>>>.value(
            _FakeEither_0<_i5.Failure, List<_i7.Skill>>(
          this,
          Invocation.method(
            #addSkill,
            [params],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, List<_i7.Skill>>>);

  @override
  _i4.Future<_i2.Either<_i5.Failure, List<_i9.Education>>> getEducationByUserID(
          String? uid) =>
      (super.noSuchMethod(
        Invocation.method(
          #getEducationByUserID,
          [uid],
        ),
        returnValue:
            _i4.Future<_i2.Either<_i5.Failure, List<_i9.Education>>>.value(
                _FakeEither_0<_i5.Failure, List<_i9.Education>>(
          this,
          Invocation.method(
            #getEducationByUserID,
            [uid],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, List<_i9.Education>>>);

  @override
  _i4.Future<
      _i2.Either<_i5.Failure, _i10.GetExperienceResDto>> getExperienceByUserID(
          String? uid) =>
      (super.noSuchMethod(
        Invocation.method(
          #getExperienceByUserID,
          [uid],
        ),
        returnValue:
            _i4.Future<_i2.Either<_i5.Failure, _i10.GetExperienceResDto>>.value(
                _FakeEither_0<_i5.Failure, _i10.GetExperienceResDto>(
          this,
          Invocation.method(
            #getExperienceByUserID,
            [uid],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, _i10.GetExperienceResDto>>);

  @override
  _i4.Future<_i2.Either<_i5.Failure, _i9.Education>> addEducation(
          _i11.AddEducationReqDto? dto) =>
      (super.noSuchMethod(
        Invocation.method(
          #addEducation,
          [dto],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.Failure, _i9.Education>>.value(
            _FakeEither_0<_i5.Failure, _i9.Education>(
          this,
          Invocation.method(
            #addEducation,
            [dto],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, _i9.Education>>);

  @override
  _i4.Future<_i2.Either<_i5.Failure, _i12.Experience>> addExperience(
          _i13.AddExperienceReqDto? dto) =>
      (super.noSuchMethod(
        Invocation.method(
          #addExperience,
          [dto],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.Failure, _i12.Experience>>.value(
            _FakeEither_0<_i5.Failure, _i12.Experience>(
          this,
          Invocation.method(
            #addExperience,
            [dto],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, _i12.Experience>>);
}
