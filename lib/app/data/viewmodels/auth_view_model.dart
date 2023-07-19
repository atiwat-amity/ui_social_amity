import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'package:amity_uikit_beta_service/amity_uikit_beta_service.dart';

class AuthState extends Equatable {
  final bool isLogin;
  const AuthState({
    required this.isLogin,
  });

  factory AuthState.initial() => const AuthState(isLogin: false);

  @override
  List<Object?> get props => [isLogin];

  @override
  bool get stringify => true;

  AuthState copyWith({
    bool? isLogin,
  }) {
    return AuthState(
      isLogin: isLogin ?? this.isLogin,
    );
  }
}

class AuthViewModel with ChangeNotifier {
  AuthState _state = AuthState.initial();
  AuthState get state => _state;

  Future<void> register(BuildContext context) async {
    try {
      AmitySLEUIKit.registerDevice(
        context: context,
        userId: 'John',
        displayName: 'John',
        callback: (isSuccess, error) {
          debugPrint('isSuccess:$isSuccess');
          debugPrint('error:$error');
          _state = _state.copyWith(isLogin: isSuccess);
          notifyListeners();
          
        },
      );
    } catch (e) {
      debugPrint('Login Error!');
    }
  }
}
