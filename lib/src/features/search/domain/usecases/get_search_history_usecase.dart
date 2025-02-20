import 'package:cosphere/src/core/domain/usecases/base_usecase.dart';
import 'package:cosphere/src/core/error/failure.dart';
import 'package:cosphere/src/features/search/domain/entities/search.dart';
import 'package:cosphere/src/features/search/domain/repositories/search_repository.dart';
import 'package:dartz/dartz.dart';

class GetSearchHistoryUsecase
    implements UsecaseWithParams<List<Search>, String> {
  final SearchRepository searchRepository;

  GetSearchHistoryUsecase({required this.searchRepository});

  @override
  Future<Either<Failure, List<Search>>> call(String params) {
    return searchRepository.getSearchHistory(params);
  }
}
