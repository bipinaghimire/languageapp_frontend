import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:languageapp_frontend/config/constants/api_endpoint.dart';
import 'package:languageapp_frontend/core/failure/failure.dart';
import 'package:languageapp_frontend/core/network/remote/http_service.dart';
import 'package:languageapp_frontend/core/shared_prefs/user_shared_pref.dart';
import 'package:languageapp_frontend/features/auth/data/dto/get_user_dto.dart';
import 'package:languageapp_frontend/features/auth/data/model/user_api_model.dart';
import 'package:languageapp_frontend/features/auth/domain/entity/user_entity.dart';

final authRemoteDataSourceProvider = Provider(
  (ref) => AuthRemoteDataSource(
    dio: ref.read(httpServiceProvider),
    userSharedPrefs: ref.read(userSharedPrefsProvider),
    userApiModel: ref.read(userApiModelProvider),
  ),
);

//registrating and login data source remotely
class AuthRemoteDataSource {
  final Dio dio;
  final UserSharedPrefs userSharedPrefs;
  final UserApiModel userApiModel;
  const AuthRemoteDataSource(
      {required this.dio,
      required this.userSharedPrefs,
      required this.userApiModel});

  // options: Options(
  //       headers: {
  //         "Content-Type": "application/json",
  //       },
  //     ),
  //     data: jsonEncode({
  //       "email": "rasdfs.praz@gmail.com",
  //       "password": "rohan123",
  //       "fullName": "rohan hari",
  //       "gender": "male",
  //       "nationality": "Nepal",
  //       "dob": "1998-01-23",
  //       "languageMedium": "nepalii",
  //       "nativeLanguage": "nepali"
  //     })

  Future<Either<Failure, bool>> registerUser(UserEntity user) async {
    try {
      Response response = await dio.post(ApiEndpoints.register, data: {
        "email": user.email,
        "password": user.password,
        "fullName": user.fullname,
        "gender": user.gender,
        "dob": user.dob,
        "nationality": user.nationality
      });
      if (response.statusCode == 200) {
        return const Right(true);
      } else {
        return Left(
          Failure(
            error: response.data["message"],
            statusCode: response.statusCode.toString(),
          ),
        );
      }
    } on DioException catch (e) {
      return Left(
        Failure(
          error: e.message.toString(),
        ),
      );
    }
  }

  Future<Either<Failure, bool>> loginUser(String email, String password) async {
    try {
      Response response = await dio.post(
        ApiEndpoints.login,
        data: {
          "email": email,
          "password": password,
        },
      );
      if (response.statusCode == 200) {
        String token = response.data["token"];
        String userId = response.data["user"]["id"];

        print("Logged-in user's ID: $userId");
        await userSharedPrefs.setUserToken(token, email, password);
        // print(token);
        return const Right(
          true,
        );
      } else {
        return Left(
          Failure(
            error: response.data["message"],
            statusCode: response.statusCode.toString(),
          ),
        );
      }
    } on DioException catch (e) {
      return Left(
        Failure(
          error: e.message.toString(),
        ),
      );
    }
  }

  //get user info
  Future<Either<Failure, UserEntity>> getUserInfo(String id) async {
    print("Fetching user info for user ID: $id");
    try {
      // Construct the URL with the user ID
      final url = '${ApiEndpoints.getUserInfo}/$id';

      // Make the HTTP GET request with the constructed URL
      Response response = await dio.get(url);

      if (response.statusCode == 200) {
        final getUserInfoDTO = GetUserInfoDTO.fromJson(response.data);
        UserEntity user = userApiModel.toUserEntity(getUserInfoDTO.data);

        print("mdcndskjncjdsvsdnvj $user");

        print("id $id");
        return Right(user);
      } else {
        return Left(
          Failure(
            error: response.data["message"],
            statusCode: response.statusCode.toString(),
          ),
        );
      }
    } on DioException catch (e) {
      return Left(
        Failure(
          error: e.message!,
          statusCode: e.response?.statusCode.toString() ?? '0',
        ),
      );
    } catch (e) {
      return Left(
        Failure(
          error: e.toString(),
          statusCode: '0',
        ),
      );
    }
  }
  // Future<Either<Failure, String>> uploadProfilePicture(
  //   File image,
  // ) async {
  //   try {
  //     String fileName = image.path.split('/').last;
  //     FormData formData = FormData.fromMap({
  //       "profilePicture": await MultipartFile.fromFile(
  //         image.path,
  //         filename: fileName,
  //       ),
  //     });

  //     Response response = await dio.post(
  //       ApiEndpoints.uploadImage,
  //       data: formData,
  //     );
  //     return Right(response.data["upload image"]);
  //   } on DioException catch (e) {
  //     return Left(
  //       Failure(
  //         error: e.error.toString(),
  //         statusCode: e.response?.statusCode.toString() ?? '0',
  //       ),
  //     );
  //   }
  // }

  Future<Either<Failure, bool>> logoutUser() async {
    try {
      Response response = await dio.get(
        ApiEndpoints.logout,
      );
      if (response.statusCode == 200) {
        await userSharedPrefs.removeUserToken();
        return const Right(true);
      } else {
        return Left(
          Failure(
            error: response.data["message"],
            statusCode: response.statusCode.toString(),
          ),
        );
      }
    } on DioException catch (e) {
      return Left(
        Failure(
          error: e.message.toString(),
          statusCode: e.response?.statusCode.toString() ?? '0',
        ),
      );
    }
  }

  //update user
  // Future<Either<Failure, bool>> updateUser(UserEntity user) async {
  //   try {
  //     Response response = await dio.put(
  //       ApiEndpoints.updateUser,
  //       data: {
  //         'username': user.fullname,
  //         'email': user.email,
  //         'password': user.password,
  //       },
  //     );
  //     if (response.statusCode == 200) {
  //       return const Right(true);
  //     } else {
  //       return Left(
  //         Failure(
  //           error: response.data["message"],
  //           statusCode: response.statusCode.toString(),
  //         ),
  //       );
  //     }
  //   } on DioException catch (e) {
  //     return Left(
  //       Failure(
  //         error: e.message.toString(),
  //         statusCode: e.response?.statusCode.toString() ?? '0',
  //       ),
  //     );
  //   }
  // }
}
