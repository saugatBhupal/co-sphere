import 'package:bloc/bloc.dart';
import 'package:cosphere/src/core/domain/entities/user.dart';
import 'package:cosphere/src/features/jobs/domain/entities/job.dart';
import 'package:cosphere/src/features/project/domain/entities/project.dart';
import 'package:cosphere/src/features/search/data/dto/add_search_history_req_dto/add_search_history_req_dto.dart';
import 'package:cosphere/src/features/search/domain/entities/search.dart';
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
    on<SearchEvent>((event, emit) async {
      if (event is GetSearchHistory) {
        await _getSearchHistory(event, emit);
      }
      if (event is AddSearchHistory) {
        await _addSearchHistory(event, emit);
      }
      if (event is GetUserByName) {
        await _getUserByName(event, emit);
      }
      if (event is GetJobByName) {
        await _getJobByName(event, emit);
      }
      if (event is GetProjectByName) {
        await _getProjectByName(event, emit);
      }
    });
  }

  Future<void> _getSearchHistory(
      GetSearchHistory event, Emitter<SearchState> emit) async {
    emit(SearchHistoryLoading());
    try {
      final result = await getSearchHistoryUsecase(event.uid);
      result.fold(
        (failure) => emit(SearchHistoryFailed(failure.message)),
        (success) => emit(GetSearchHistorySuccess(search: success)),
      );
    } catch (e) {
      emit(SearchHistoryFailed("Error: ${e.toString()}"));
    }
  }

  Future<void> _addSearchHistory(
      AddSearchHistory event, Emitter<SearchState> emit) async {
    emit(SearchHistoryLoading());
    try {
      final result = await addSearchHistoryUsecase(event.dto);
      result.fold(
        (failure) => emit(SearchHistoryFailed(failure.message)),
        (success) => emit(const AddSearchHistorySuccess()),
      );
    } catch (e) {
      emit(SearchHistoryFailed("Error: ${e.toString()}"));
    }
  }

  Future<void> _getUserByName(
      GetUserByName event, Emitter<SearchState> emit) async {
    emit(SearchHistoryLoading());
    try {
      final result = await getUsersByNameUsecase(event.query);
      result.fold(
        (failure) => emit(SearchHistoryFailed(failure.message)),
        (success) => emit(GetUserByNameSuccess(users: success)),
      );
    } catch (e) {
      emit(SearchHistoryFailed("Error: ${e.toString()}"));
    }
  }

  Future<void> _getProjectByName(
      GetProjectByName event, Emitter<SearchState> emit) async {
    emit(SearchHistoryLoading());
    try {
      final result = await getProjectByNameUsecase(event.query);
      result.fold(
        (failure) => emit(SearchHistoryFailed(failure.message)),
        (success) => emit(GetProjectByNameSuccess(projects: success)),
      );
    } catch (e) {
      emit(SearchHistoryFailed("Error: ${e.toString()}"));
    }
  }

  Future<void> _getJobByName(
      GetJobByName event, Emitter<SearchState> emit) async {
    emit(SearchHistoryLoading());
    try {
      final result = await getJobsByNameUsecase(event.query);
      result.fold(
        (failure) => emit(SearchHistoryFailed(failure.message)),
        (success) => emit(GetJobByNameSuccess(jobs: success)),
      );
    } catch (e) {
      emit(SearchHistoryFailed("Error: ${e.toString()}"));
    }
  }
}
