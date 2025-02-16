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

  factory Skill.fromJson(Map<String, dynamic> json) {
    return Skill(
      uid: json['_id'] as String? ?? '',
      name: json['name'] as String? ?? 'Unknown',
    );
  }
  Map<String, dynamic> toJson() {
    return {'_id': uid, 'name': name};
  }

  @override
  List<Object?> get props => [uid, name];
}
