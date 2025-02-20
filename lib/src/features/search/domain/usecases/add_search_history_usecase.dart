import 'package:cosphere/src/core/domain/usecases/base_usecase.dart';
import 'package:cosphere/src/core/error/failure.dart';
import 'package:cosphere/src/features/search/data/dto/add_search_history_req_dto/add_search_history_req_dto.dart';
import 'package:cosphere/src/features/search/domain/repositories/search_repository.dart';
import 'package:dartz/dartz.dart';

class AddSearchHistoryUsecase
    implements UsecaseWithParams<void, AddSearchHistoryReqDto> {
  final SearchRepository searchRepository;

  AddSearchHistoryUsecase({required this.searchRepository});

  @override
  Future<Either<Failure, void>> call(AddSearchHistoryReqDto params) {
    return searchRepository.addSearchHistory(params);
  }
}
