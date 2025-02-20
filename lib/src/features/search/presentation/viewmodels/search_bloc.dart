import 'package:bloc/bloc.dart';
import 'package:cosphere/src/features/search/domain/usecases/add_search_history_usecase.dart';
import 'package:cosphere/src/features/search/domain/usecases/get_jobs_by_name_usecase.dart';
import 'package:cosphere/src/features/search/domain/usecases/get_project_by_name_usecase.dart';
import 'package:cosphere/src/features/search/domain/usecases/get_search_history_usecase.dart';
import 'package:cosphere/src/features/search/domain/usecases/get_users_by_name_usecase.dart';
import 'package:equatable/equatable.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final GetSearchHistoryUsecase getSearchHistoryUsecase;
  final AddSearchHistoryUsecase addSearchHistoryUsecase;
  final GetUsersByNameUsecase getUsersByNameUsecase;
  final GetJobsByNameUsecase getJobsByNameUsecase;
  final GetProjectByNameUsecase getProjectByNameUsecase;
  SearchBloc({
    required this.getSearchHistoryUsecase,
    required this.addSearchHistoryUsecase,
    required this.getUsersByNameUsecase,
    required this.getJobsByNameUsecase,
    required this.getProjectByNameUsecase,
  }) : super(SearchInitial()) {
    on<SearchEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
