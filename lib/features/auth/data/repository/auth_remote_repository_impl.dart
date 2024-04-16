import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:languageapp_frontend/core/failure/failure.dart';
import 'package:languageapp_frontend/features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:languageapp_frontend/features/auth/domain/entity/user_entity.dart';
import 'package:languageapp_frontend/features/auth/domain/repository/auth_repository.dart';

final authRemoteRepository =
    Provider<IAuthRepository>((ref) => AuthRemoteRepoImpl(
          authRemoteDataSource: ref.watch(authRemoteDataSourceProvider),
        ));

//making remote repository
class AuthRemoteRepoImpl implements IAuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;
  AuthRemoteRepoImpl({required this.authRemoteDataSource});

  @override
  Future<Either<Failure, bool>> loginUser(String email, String password) {
    return authRemoteDataSource.loginUser(email, password);
  }

  @override
  Future<Either<Failure, bool>> registerUser(UserEntity user) {
    return authRemoteDataSource.registerUser(user);
  }

  // @override
  // Future<Either<Failure, String>> uploadProfilePicture(File file) {
  //   return authRemoteDataSource.uploadProfilePicture(file);
  // }

  @override
  Future<Either<Failure, UserEntity>> getUserInfo(String id) async {
    try {
      final result = await authRemoteDataSource.getUserInfo(id);
      return result;
    } catch (e) {
      return Left(Failure(error: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> logoutUser() {
    return authRemoteDataSource.logoutUser();
  }

  // @override
  // Future<Either<Failure, bool>> updateUser(UserEntity user) {
  //   return authRemoteDataSource.updateUser(user);
  // }
}
