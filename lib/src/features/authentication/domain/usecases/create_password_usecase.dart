import 'package:cosphere/src/core/domain/usecases/base_usecase.dart';
import 'package:cosphere/src/core/error/failure.dart';
import 'package:cosphere/src/features/authentication/data/dto/create_password/create_password_request_dto.dart';
import 'package:cosphere/src/features/authentication/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class CreatePasswordUsecase
    implements UsecaseWithParams<String, CreatePasswordRequestDto> {
  final AuthRepository authRepository;

  CreatePasswordUsecase({required this.authRepository});
  @override
  Future<Either<Failure, String>> call(CreatePasswordRequestDto params) {
    return authRepository.createPassword(params);
  }
}
