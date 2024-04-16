import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:languageapp_frontend/core/failure/failure.dart';
import 'package:languageapp_frontend/features/auth/domain/entity/user_entity.dart';
import 'package:languageapp_frontend/features/auth/domain/repository/auth_repository.dart';

//use case for authentication
final authUseCaseProvider = Provider((ref) {
  return AuthUseCase(
    ref.watch(authRepositoryProvider),
  );
});

class AuthUseCase {
  final IAuthRepository _authRepository;

  AuthUseCase(this._authRepository);

  Future<Either<Failure, bool>> registerUser(UserEntity user) async {
    return await _authRepository.registerUser(user);
  }

  Future<Either<Failure, UserEntity>> getUserInfo(String id) async {
    return await _authRepository.getUserInfo(id);
  }

  Future<Either<Failure, bool>> loginUser(String email, String password) async {
    return await _authRepository.loginUser(email, password);
  }

  // Future<Either<Failure, String>> uploadProfilePicture(File file) async {
  //   return await _authRepository.uploadProfilePicture(file);
  // }

  Future<Either<Failure, bool>> logoutUser() async {
    return await _authRepository.logoutUser();
  }
}
