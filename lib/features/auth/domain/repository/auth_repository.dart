// repository for authentication
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:languageapp_frontend/core/failure/failure.dart';
import 'package:languageapp_frontend/features/auth/data/repository/auth_remote_repository_impl.dart';
import 'package:languageapp_frontend/features/auth/domain/entity/user_entity.dart';

final authRepositoryProvider = Provider<IAuthRepository>((ref) {
  return ref.watch(authRemoteRepository);
});

abstract class IAuthRepository {
  Future<Either<Failure, bool>> registerUser(UserEntity user);
  Future<Either<Failure, UserEntity>> getUserInfo(String id);
  Future<Either<Failure, bool>> loginUser(String email, String password);
  // Future<Either<Failure, String>> uploadProfilePicture(File file);
  Future<Either<Failure, bool>> logoutUser();
  // Future<Either<Failure, bool>> updateUser(UserEntity user);
}
