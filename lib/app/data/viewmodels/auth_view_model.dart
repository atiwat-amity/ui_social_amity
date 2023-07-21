import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'package:amity_uikit_beta_service/amity_uikit_beta_service.dart';

class AuthState extends Equatable {
  final bool isLogin;
  final TextEditingController userIdController;
  final TextEditingController displayNameController;
  const AuthState({
    required this.isLogin,
    required this.userIdController,
    required this.displayNameController,
  });

  factory AuthState.initial() => AuthState(
        isLogin: false,
        userIdController: TextEditingController(),
        displayNameController: TextEditingController(),
      );

  @override
  List<Object?> get props => [isLogin, userIdController, displayNameController];

  @override
  bool get stringify => true;

  AuthState copyWith({
    bool? isLogin,
    TextEditingController? userIdController,
    TextEditingController? displayNameController,
  }) {
    return AuthState(
      isLogin: isLogin ?? this.isLogin,
      userIdController: userIdController ?? this.userIdController,
      displayNameController: displayNameController ?? this.displayNameController,
    );
  }
}

class AuthViewModel with ChangeNotifier {
  AuthState _state = AuthState.initial();
  AuthState get state => _state;

  AuthViewModel(){
    _state.userIdController.text = 'John';
    _state.displayNameController.text = '';
  }

  Future<void> login(BuildContext context) async {
    try {
      final userId = _state.userIdController.value.text;
      final displayName = _state.displayNameController.value.text;
      AmitySLEUIKit.registerDevice(
        context: context,
        userId: userId,
        displayName: displayName.isEmpty ? null: displayName,
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

  void logout() {
    AmitySLEUIKit.unRegisterDevice();
    _state = _state.copyWith(isLogin: false);
    notifyListeners();
  }

  @override
  void dispose() {
    state.displayNameController.dispose();
    state.userIdController.dispose();
    super.dispose();
  }
}
