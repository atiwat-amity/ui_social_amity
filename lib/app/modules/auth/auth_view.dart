import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_social_amity/app/constants/colors.dart';
import 'package:ui_social_amity/app/data/viewmodels/auth_view_model.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthViewModel>(
      builder: (context, vm, child) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Login to Amity',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 16),
                InputBox(
                  controller: vm.state.userIdController,
                  title: 'USER ID',
                ),
                InputBox(
                  controller: vm.state.displayNameController,
                  title: 'DISPLAY NAME',
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                  ),
                  onPressed: () =>
                      context.read<AuthViewModel>().login(context),
                  child: const SizedBox(width: 80, child:  Center(child: Text('Login'))),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class InputBox extends StatelessWidget {
  const InputBox({super.key, required this.controller, required this.title});
  final TextEditingController controller;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ],
          ),
          const SizedBox(height: 5),
          TextFormField(
            controller: controller,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(10.0),
              filled: true,
              hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: AppColors.secondary),
                borderRadius: BorderRadius.circular(6),
              ),
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(6)),
                borderSide: BorderSide(
                  width: 1,
                  color: AppColors.primary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
