import 'package:equatable/equatable.dart';

class JobSection extends Equatable {
  final String title;
  final String? description;
  final List<String>? lstDescription;

  const JobSection(
      {required this.title, this.description, this.lstDescription});

  factory JobSection.initial() {
    return const JobSection(title: '', description: '', lstDescription: []);
  }
  JobSection copywith({
    String? title,
    String? description,
    List<String>? lstDescription,
  }) {
    return JobSection(
      title: title ?? this.title,
      description: description ?? this.description,
      lstDescription: lstDescription ?? List.from(this.lstDescription ?? []),
    );
  }

  @override
  List<Object> get props => [title];
}
