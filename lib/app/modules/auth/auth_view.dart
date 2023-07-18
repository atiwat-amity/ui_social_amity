import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_social_amity/app/constants/colors.dart';
import 'package:ui_social_amity/app/data/viewmodels/auth_view_model.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
          ),
          onPressed: () => context.read<AuthViewModel>().register(context),
          child: const Text('Login to Amity'),
        ),
      ),
    );
  }
}
