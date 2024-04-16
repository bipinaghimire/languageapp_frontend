// auth state for user

import 'package:languageapp_frontend/features/auth/domain/entity/user_entity.dart';

class AuthState {
  final bool isLoading;
  final String? error;
  final UserEntity? user;
  final String? imageName;

  AuthState({required this.isLoading, this.error, this.imageName, this.user});

  factory AuthState.initial() {
    return AuthState(
        isLoading: false, error: null, imageName: null, user: null);
  }

  AuthState copyWith(
      {bool? isLoading, String? error, String? imageName, UserEntity? user}) {
    return AuthState(
        isLoading: isLoading ?? this.isLoading,
        error: error ?? this.error,
        imageName: imageName ?? this.imageName,
        user: user ?? this.user);
  }

  @override
  String toString() =>
      'AuthState(isLoading: $isLoading, error: $error, imageName:$imageName, user: $user)';
}
