part of 'search_bloc.dart';

sealed class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

final class SearchInitial extends SearchState {}

class SearchHistoryLoading extends SearchState {}

class GetSearchHistorySuccess extends SearchState {
  final List<Search> search;

  const GetSearchHistorySuccess({required this.search});
}

class SearchHistoryFailed extends SearchState {
  final String message;

  const SearchHistoryFailed(this.message);
}

class AddSearchHistorySuccess extends SearchState {
  const AddSearchHistorySuccess();
}

class GetUserByNameSuccess extends SearchState {
  final List<User> users;
  const GetUserByNameSuccess({required this.users});
}

class GetJobByNameSuccess extends SearchState {
  final List<Job> jobs;
  const GetJobByNameSuccess({required this.jobs});
}

class GetProjectByNameSuccess extends SearchState {
  final List<Project> projects;
  const GetProjectByNameSuccess({required this.projects});
}
