// Mocks generated by Mockito 5.4.4 from annotations
// in cosphere/test/mockito_test/usecase_mockito_test/search_usecases/search_history/get_search_history_usecase_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:cosphere/src/core/domain/entities/user.dart' as _i8;
import 'package:cosphere/src/core/error/failure.dart' as _i5;
import 'package:cosphere/src/features/jobs/domain/entities/job.dart' as _i9;
import 'package:cosphere/src/features/project/domain/entities/project.dart'
    as _i10;
import 'package:cosphere/src/features/search/data/dto/add_search_history_req_dto/add_search_history_req_dto.dart'
    as _i7;
import 'package:cosphere/src/features/search/domain/entities/search.dart'
    as _i6;
import 'package:cosphere/src/features/search/domain/repositories/search_repository.dart'
    as _i3;
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

/// A class which mocks [SearchRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockSearchRepository extends _i1.Mock implements _i3.SearchRepository {
  MockSearchRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Either<_i5.Failure, List<_i6.Search>>> getSearchHistory(
          String? uid) =>
      (super.noSuchMethod(
        Invocation.method(
          #getSearchHistory,
          [uid],
        ),
        returnValue:
            _i4.Future<_i2.Either<_i5.Failure, List<_i6.Search>>>.value(
                _FakeEither_0<_i5.Failure, List<_i6.Search>>(
          this,
          Invocation.method(
            #getSearchHistory,
            [uid],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, List<_i6.Search>>>);

  @override
  _i4.Future<_i2.Either<_i5.Failure, void>> addSearchHistory(
          _i7.AddSearchHistoryReqDto? dto) =>
      (super.noSuchMethod(
        Invocation.method(
          #addSearchHistory,
          [dto],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.Failure, void>>.value(
            _FakeEither_0<_i5.Failure, void>(
          this,
          Invocation.method(
            #addSearchHistory,
            [dto],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, void>>);

  @override
  _i4.Future<_i2.Either<_i5.Failure, List<_i8.User>>> getUsersByName(
          String? query) =>
      (super.noSuchMethod(
        Invocation.method(
          #getUsersByName,
          [query],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.Failure, List<_i8.User>>>.value(
            _FakeEither_0<_i5.Failure, List<_i8.User>>(
          this,
          Invocation.method(
            #getUsersByName,
            [query],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, List<_i8.User>>>);

  @override
  _i4.Future<_i2.Either<_i5.Failure, List<_i9.Job>>> getJobsByName(
          String? query) =>
      (super.noSuchMethod(
        Invocation.method(
          #getJobsByName,
          [query],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.Failure, List<_i9.Job>>>.value(
            _FakeEither_0<_i5.Failure, List<_i9.Job>>(
          this,
          Invocation.method(
            #getJobsByName,
            [query],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, List<_i9.Job>>>);

  @override
  _i4.Future<_i2.Either<_i5.Failure, List<_i10.Project>>> getProjectsByName(
          String? query) =>
      (super.noSuchMethod(
        Invocation.method(
          #getProjectsByName,
          [query],
        ),
        returnValue:
            _i4.Future<_i2.Either<_i5.Failure, List<_i10.Project>>>.value(
                _FakeEither_0<_i5.Failure, List<_i10.Project>>(
          this,
          Invocation.method(
            #getProjectsByName,
            [query],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, List<_i10.Project>>>);
}
