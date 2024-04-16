// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:languageapp_frontend/config/router/app_routes.dart';
import 'package:languageapp_frontend/features/auth/domain/entity/user_entity.dart';
import 'package:languageapp_frontend/features/auth/domain/use_case/auth_usecase.dart';
import 'package:languageapp_frontend/features/auth/presentation/state/auth_state.dart';
import 'package:languageapp_frontend/features/auth/presentation/view/widgets/login_error.dart';
import 'package:languageapp_frontend/features/auth/presentation/view/widgets/logout_error.dart';

final authViewModelProvider =
    StateNotifierProvider<AuthViewModel, AuthState>((ref) {
  return AuthViewModel(ref.watch(authUseCaseProvider));
});

class AuthViewModel extends StateNotifier<AuthState> {
  final AuthUseCase _authUseCase;
  AuthViewModel(this._authUseCase) : super(AuthState(isLoading: false));

  Future<void> registerUser(UserEntity user) async {
    state = state.copyWith(isLoading: true);
    var data = await _authUseCase.registerUser(user);
    data.fold(
      (failure) => state = state.copyWith(
        isLoading: false,
        error: failure.error,
      ),
      (success) => state = state.copyWith(
        isLoading: false,
        error: success.toString(),
      ),
    );
  }

  Future<void> loginUser(BuildContext context, email, String password) async {
    state = state.copyWith(isLoading: true);

    // Perform regular login
    var data = await _authUseCase.loginUser(email, password);
    data.fold(
      (failure) {
        state = state.copyWith(isLoading: false, error: failure.error);
        showErrorDialog(context, 'Invalid credentials');
        print("invalid");
      },
      (success) async {
        state = state.copyWith(isLoading: false, error: null);
        Navigator.pushNamed(context, AppRoute.preDashRoute);
      },
    );
  }

  //get user info
  Future<void> getUserInfo(String id) async {
    state = AuthState(isLoading: true);
    final result = await _authUseCase.getUserInfo(id);
    result.fold(
      (failure) => state = AuthState(isLoading: false, error: failure.error),
      (user) => state = AuthState(isLoading: false, user: user),
    );
  }

  //logout user
  Future<void> logoutUser(BuildContext context) async {
    state = state.copyWith(isLoading: true);
    var data = await _authUseCase.logoutUser();
    data.fold(
      (failure) {
        state = state.copyWith(isLoading: false, error: failure.error);
        logoutshowErrorDialog(context, failure.error);
      },
      (success) {
        state = state.copyWith(isLoading: false, error: null);
        Navigator.pushNamed(context, AppRoute.loginsignup);
      },
    );
  }
}
