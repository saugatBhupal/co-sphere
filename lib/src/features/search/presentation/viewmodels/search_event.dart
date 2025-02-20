part of 'search_bloc.dart';

sealed class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class GetSearchHistory extends SearchEvent {
  final String uid;

  const GetSearchHistory({required this.uid});
}

class AddSearchHistory extends SearchEvent {
  final AddSearchHistoryReqDto dto;

  const AddSearchHistory({required this.dto});
}

class GetUserByName extends SearchEvent {
  final String query;

  const GetUserByName({required this.query});
}

class GetJobByName extends SearchEvent {
  final String query;

  const GetJobByName({required this.query});
}

class GetProjectByName extends SearchEvent {
  final String query;

  const GetProjectByName({required this.query});
}
