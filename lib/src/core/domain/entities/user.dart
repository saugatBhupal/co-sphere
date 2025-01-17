import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String uid;
  final String email;
  final String name;
  final String dob;
  final String address;
  final String password;
  final bool verified;

  const User({
    required this.uid,
    required this.email,
    required this.name,
    required this.dob,
    required this.address,
    required this.password,
    required this.verified,
  });

  User copyWith({
    String? uid,
    String? email,
    String? name,
    String? dob,
    String? address,
    String? password,
    bool? verified,
  }) {
    return User(
      uid: uid ?? this.uid,
      email: email ?? this.email,
      name: name ?? this.name,
      dob: dob ?? this.dob,
      address: address ?? this.address,
      password: password ?? this.password,
      verified: verified ?? this.verified,
    );
  }

  @override
  List<Object?> get props => [uid, email, name, dob, address, password];
}
