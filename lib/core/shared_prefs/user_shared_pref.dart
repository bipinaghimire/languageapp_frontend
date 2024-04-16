import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:languageapp_frontend/core/failure/failure.dart';
import 'package:shared_preferences/shared_preferences.dart';

final userSharedPrefsProvider = Provider((ref) => UserSharedPrefs());

class UserSharedPrefs {
  late SharedPreferences _sharedPreferences;

  Future<Either<Failure, bool>> setUserToken(
      String token, String email, String password) async {
    try {
      _sharedPreferences = await SharedPreferences.getInstance();
      await _sharedPreferences.setString("token", token);
      await _sharedPreferences.setString("email", email);
      await _sharedPreferences.setString("password", password);
      String? username1 = _sharedPreferences.getString('email');
      print("adsdsadasdf// $username1");
      print("tokennnnnnnnnnnnnnnnnnnnnnnnn $token");
      return right(true);
    } catch (e) {
      return left(Failure(error: e.toString()));
    }
  }

  //get user token
  Future<Either<Failure, String>> getUserToken() async {
    try {
      _sharedPreferences = await SharedPreferences.getInstance();
      String? token = _sharedPreferences.getString("token");
      if (token != null) {
        return right("tookkkkeeenn $token");
      } else {
        return left(Failure(error: "No token found"));
      }
    } catch (e) {
      return left(Failure(error: e.toString()));
    }
  }

  //get logged in user's id
  Future<Either<Failure, String>> getUserId() async {
    try {
      _sharedPreferences = await SharedPreferences.getInstance();
      String? userId = _sharedPreferences.getString("userId");
      if (userId != null) {
        print("usedrsdhfhbdshbf $userId");
        return right("usedrsdhfhbdshbf $userId");
      } else {
        return left(Failure(error: "No userId found"));
      }
    } catch (e) {
      return left(Failure(error: e.toString()));
    }
  }

// get isLogout
  Future<Either<Failure, bool>> getIsLogout() async {
    try {
      _sharedPreferences = await SharedPreferences.getInstance();
      bool? isLogout = _sharedPreferences.getBool("isLogout");
      if (isLogout != null) {
        return right(isLogout);
      } else {
        return left(Failure(error: "No isLogout found"));
      }
    } catch (e) {
      return left(Failure(error: e.toString()));
    }
  }

  Future<Either<Failure, bool>> deleteUserToken() async {
    try {
      _sharedPreferences = await SharedPreferences.getInstance();
      await _sharedPreferences.remove('token');
      await _sharedPreferences.setBool('isLogout', true);
      return right(true);
    } catch (e) {
      return left(Failure(error: e.toString()));
    }
  }

  Future<Either<Failure, bool>> removeUserToken() async {
    try {
      _sharedPreferences = await SharedPreferences.getInstance();
      await _sharedPreferences.remove('token');
      return right(true);
    } catch (e) {
      return left(Failure(error: e.toString()));
    }
  }
}
