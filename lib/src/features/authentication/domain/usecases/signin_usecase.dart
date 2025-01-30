import 'package:cosphere/src/core/domain/entities/user.dart';
import 'package:cosphere/src/core/domain/usecases/base_usecase.dart';
import 'package:cosphere/src/core/error/failure.dart';
import 'package:cosphere/src/features/authentication/data/dto/sign_in/sign_in_request_dto.dart';
import 'package:cosphere/src/features/authentication/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class SigninUsecase implements UsecaseWithParams<User, SigninRequestDto> {
  final AuthRepository authRepository;

  SigninUsecase({required this.authRepository});
  @override
  Future<Either<Failure, User>> call(SigninRequestDto params) {
    return authRepository.signin(params);
  }
}
