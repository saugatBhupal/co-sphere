import 'package:cosphere/src/core/domain/entities/user.dart';
import 'package:cosphere/src/core/domain/usecases/base_usecase.dart';
import 'package:cosphere/src/core/error/failure.dart';
import 'package:cosphere/src/features/authentication/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class SigninUsecase implements UsecaseWithParams<User, SigninParams> {
  final AuthRepository authRepository;

  SigninUsecase({required this.authRepository});
  @override
  Future<Either<Failure, User>> call(SigninParams params) {
    return authRepository.signin(params);
  }
}

class SigninParams extends Equatable {
  final String email;
  final String name;
  final String phone;
  final String dob;
  final String address;
  final String password;

  const SigninParams({
    required this.email,
    required this.name,
    required this.phone,
    required this.dob,
    required this.address,
    required this.password,
  });

  const SigninParams.initial()
      : email = '',
        name = '',
        phone = '',
        dob = '',
        address = '',
        password = '';
  @override
  List<Object?> get props => [email, name, phone, dob, address, password];
}
