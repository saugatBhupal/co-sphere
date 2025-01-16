import 'package:cosphere/src/core/domain/entities/user.dart';
import 'package:cosphere/src/core/domain/usecases/base_usecase.dart';
import 'package:cosphere/src/core/error/failure.dart';
import 'package:cosphere/src/features/authentication/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class SignupUsecase implements UsecaseWithParams<User, SignupParams> {
  final AuthRepository authRepository;

  SignupUsecase({required this.authRepository});
  @override
  Future<Either<Failure, User>> call(SignupParams params) {
    return authRepository.signup(params);
  }
}

class SignupParams extends Equatable {
  final String email;
  final String name;
  final String phone;
  final String dob;
  final String address;
  final String password;

  const SignupParams({
    required this.email,
    required this.name,
    required this.phone,
    required this.dob,
    required this.address,
    required this.password,
  });

  const SignupParams.initial()
      : email = '',
        name = '',
        phone = '',
        dob = '',
        address = '',
        password = '';
  SignupParams copyWith({
    String? email,
    String? name,
    String? phone,
    String? dob,
    String? address,
    String? password,
  }) {
    return SignupParams(
      email: email ?? this.email,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      dob: dob ?? this.dob,
      address: address ?? this.address,
      password: password ?? this.password,
    );
  } 

  @override
  List<Object?> get props => [email, name, phone, dob, address, password];
}
