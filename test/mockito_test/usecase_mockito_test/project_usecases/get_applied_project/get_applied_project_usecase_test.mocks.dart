// Mocks generated by Mockito 5.4.4 from annotations
// in cosphere/test/mockito_test/usecase_mockito_test/project_usecases/get_applied_project/get_applied_project_usecase_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:cosphere/src/core/error/failure.dart' as _i5;
import 'package:cosphere/src/features/jobs/domain/entities/applicants.dart'
    as _i7;
import 'package:cosphere/src/features/profile/domain/entities/reviews.dart'
    as _i12;
import 'package:cosphere/src/features/project/data/dto/add_review/add_review_req_dto.dart'
    as _i13;
import 'package:cosphere/src/features/project/data/dto/apply_project/apply_project_req_dto.dart'
    as _i16;
import 'package:cosphere/src/features/project/data/dto/complete_project/complete_project_req_dto.dart'
    as _i14;
import 'package:cosphere/src/features/project/data/dto/create_project/create_project_req_dto.dart'
    as _i15;
import 'package:cosphere/src/features/project/data/dto/create_task/create_task_req_dto.dart'
    as _i11;
import 'package:cosphere/src/features/project/data/dto/hire_user/hire_user_req_dto.dart'
    as _i8;
import 'package:cosphere/src/features/project/domain/entities/project.dart'
    as _i6;
import 'package:cosphere/src/features/project/domain/entities/tasks.dart'
    as _i9;
import 'package:cosphere/src/features/project/domain/repositories/project_repository.dart'
    as _i3;
import 'package:cosphere/src/features/project/domain/usecases/complete_task_usecase.dart'
    as _i10;
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

/// A class which mocks [ProjectRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockProjectRepository extends _i1.Mock implements _i3.ProjectRepository {
  MockProjectRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Either<_i5.Failure, List<_i6.Project>>>
      getHiringProjectsByUser(String? uid) => (super.noSuchMethod(
            Invocation.method(
              #getHiringProjectsByUser,
              [uid],
            ),
            returnValue:
                _i4.Future<_i2.Either<_i5.Failure, List<_i6.Project>>>.value(
                    _FakeEither_0<_i5.Failure, List<_i6.Project>>(
              this,
              Invocation.method(
                #getHiringProjectsByUser,
                [uid],
              ),
            )),
          ) as _i4.Future<_i2.Either<_i5.Failure, List<_i6.Project>>>);

  @override
  _i4.Future<_i2.Either<_i5.Failure, List<_i6.Project>>>
      getActiveProjectsByUser(String? uid) => (super.noSuchMethod(
            Invocation.method(
              #getActiveProjectsByUser,
              [uid],
            ),
            returnValue:
                _i4.Future<_i2.Either<_i5.Failure, List<_i6.Project>>>.value(
                    _FakeEither_0<_i5.Failure, List<_i6.Project>>(
              this,
              Invocation.method(
                #getActiveProjectsByUser,
                [uid],
              ),
            )),
          ) as _i4.Future<_i2.Either<_i5.Failure, List<_i6.Project>>>);

  @override
  _i4.Future<_i2.Either<_i5.Failure, List<_i6.Project>>>
      getCompletedProjectsByUser(String? uid) => (super.noSuchMethod(
            Invocation.method(
              #getCompletedProjectsByUser,
              [uid],
            ),
            returnValue:
                _i4.Future<_i2.Either<_i5.Failure, List<_i6.Project>>>.value(
                    _FakeEither_0<_i5.Failure, List<_i6.Project>>(
              this,
              Invocation.method(
                #getCompletedProjectsByUser,
                [uid],
              ),
            )),
          ) as _i4.Future<_i2.Either<_i5.Failure, List<_i6.Project>>>);

  @override
  _i4.Future<_i2.Either<_i5.Failure, _i6.Project>> getProjectById(
          String? projectId) =>
      (super.noSuchMethod(
        Invocation.method(
          #getProjectById,
          [projectId],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.Failure, _i6.Project>>.value(
            _FakeEither_0<_i5.Failure, _i6.Project>(
          this,
          Invocation.method(
            #getProjectById,
            [projectId],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, _i6.Project>>);

  @override
  _i4.Future<_i2.Either<_i5.Failure, _i7.Applicants>> hireUser(
          _i8.HireUserReqDto? params) =>
      (super.noSuchMethod(
        Invocation.method(
          #hireUser,
          [params],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.Failure, _i7.Applicants>>.value(
            _FakeEither_0<_i5.Failure, _i7.Applicants>(
          this,
          Invocation.method(
            #hireUser,
            [params],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, _i7.Applicants>>);

  @override
  _i4.Future<_i2.Either<_i5.Failure, _i7.Applicants>> rejectUser(
          _i8.HireUserReqDto? params) =>
      (super.noSuchMethod(
        Invocation.method(
          #rejectUser,
          [params],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.Failure, _i7.Applicants>>.value(
            _FakeEither_0<_i5.Failure, _i7.Applicants>(
          this,
          Invocation.method(
            #rejectUser,
            [params],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, _i7.Applicants>>);

  @override
  _i4.Future<_i2.Either<_i5.Failure, String>> finishHiring(String? projectId) =>
      (super.noSuchMethod(
        Invocation.method(
          #finishHiring,
          [projectId],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.Failure, String>>.value(
            _FakeEither_0<_i5.Failure, String>(
          this,
          Invocation.method(
            #finishHiring,
            [projectId],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, String>>);

  @override
  _i4.Future<_i2.Either<_i5.Failure, _i9.Tasks>> completeTask(
          _i10.CompleteTaskParams? params) =>
      (super.noSuchMethod(
        Invocation.method(
          #completeTask,
          [params],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.Failure, _i9.Tasks>>.value(
            _FakeEither_0<_i5.Failure, _i9.Tasks>(
          this,
          Invocation.method(
            #completeTask,
            [params],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, _i9.Tasks>>);

  @override
  _i4.Future<_i2.Either<_i5.Failure, _i9.Tasks>> createTask(
          _i11.CreateTaskReqDto? dto) =>
      (super.noSuchMethod(
        Invocation.method(
          #createTask,
          [dto],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.Failure, _i9.Tasks>>.value(
            _FakeEither_0<_i5.Failure, _i9.Tasks>(
          this,
          Invocation.method(
            #createTask,
            [dto],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, _i9.Tasks>>);

  @override
  _i4.Future<_i2.Either<_i5.Failure, List<_i6.Project>>> getProjectsByUser(
          String? uid) =>
      (super.noSuchMethod(
        Invocation.method(
          #getProjectsByUser,
          [uid],
        ),
        returnValue:
            _i4.Future<_i2.Either<_i5.Failure, List<_i6.Project>>>.value(
                _FakeEither_0<_i5.Failure, List<_i6.Project>>(
          this,
          Invocation.method(
            #getProjectsByUser,
            [uid],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, List<_i6.Project>>>);

  @override
  _i4.Future<_i2.Either<_i5.Failure, List<_i6.Project>>> getAppliedProjects(
          String? uid) =>
      (super.noSuchMethod(
        Invocation.method(
          #getAppliedProjects,
          [uid],
        ),
        returnValue:
            _i4.Future<_i2.Either<_i5.Failure, List<_i6.Project>>>.value(
                _FakeEither_0<_i5.Failure, List<_i6.Project>>(
          this,
          Invocation.method(
            #getAppliedProjects,
            [uid],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, List<_i6.Project>>>);

  @override
  _i4.Future<_i2.Either<_i5.Failure, List<_i12.Reviews>>> addReview(
          _i13.AddReviewReqDto? dto) =>
      (super.noSuchMethod(
        Invocation.method(
          #addReview,
          [dto],
        ),
        returnValue:
            _i4.Future<_i2.Either<_i5.Failure, List<_i12.Reviews>>>.value(
                _FakeEither_0<_i5.Failure, List<_i12.Reviews>>(
          this,
          Invocation.method(
            #addReview,
            [dto],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, List<_i12.Reviews>>>);

  @override
  _i4.Future<_i2.Either<_i5.Failure, String>> completeProject(
          _i14.CompleteProjectReqDto? dto) =>
      (super.noSuchMethod(
        Invocation.method(
          #completeProject,
          [dto],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.Failure, String>>.value(
            _FakeEither_0<_i5.Failure, String>(
          this,
          Invocation.method(
            #completeProject,
            [dto],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, String>>);

  @override
  _i4.Future<_i2.Either<_i5.Failure, _i12.Reviews>> getReviewById(
          String? reviewId) =>
      (super.noSuchMethod(
        Invocation.method(
          #getReviewById,
          [reviewId],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.Failure, _i12.Reviews>>.value(
            _FakeEither_0<_i5.Failure, _i12.Reviews>(
          this,
          Invocation.method(
            #getReviewById,
            [reviewId],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, _i12.Reviews>>);

  @override
  _i4.Future<_i2.Either<_i5.Failure, _i6.Project>> createProject(
          _i15.CreateProjectReqDto? dto) =>
      (super.noSuchMethod(
        Invocation.method(
          #createProject,
          [dto],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.Failure, _i6.Project>>.value(
            _FakeEither_0<_i5.Failure, _i6.Project>(
          this,
          Invocation.method(
            #createProject,
            [dto],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, _i6.Project>>);

  @override
  _i4.Future<_i2.Either<_i5.Failure, List<_i6.Project>>> getExploreProjects(
          String? uid) =>
      (super.noSuchMethod(
        Invocation.method(
          #getExploreProjects,
          [uid],
        ),
        returnValue:
            _i4.Future<_i2.Either<_i5.Failure, List<_i6.Project>>>.value(
                _FakeEither_0<_i5.Failure, List<_i6.Project>>(
          this,
          Invocation.method(
            #getExploreProjects,
            [uid],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, List<_i6.Project>>>);

  @override
  _i4.Future<_i2.Either<_i5.Failure, _i6.Project>> applyToProject(
          _i16.ApplyProjectReqDto? dto) =>
      (super.noSuchMethod(
        Invocation.method(
          #applyToProject,
          [dto],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.Failure, _i6.Project>>.value(
            _FakeEither_0<_i5.Failure, _i6.Project>(
          this,
          Invocation.method(
            #applyToProject,
            [dto],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, _i6.Project>>);
}
