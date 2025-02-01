import 'package:equatable/equatable.dart';

class Skill extends Equatable {
  final String uid;
  final String name;

  const Skill({required this.uid, required this.name});

  factory Skill.initial() {
    return const Skill(uid: '', name: '');
  }
  Skill copyWith({String? uid, String? name}) {
    return Skill(uid: uid ?? this.uid, name: name ?? this.name);
  }

  @override
  List<Object?> get props => [uid, name];
}
