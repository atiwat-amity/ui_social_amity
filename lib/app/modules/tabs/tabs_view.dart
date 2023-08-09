import 'package:amity_uikit_beta_service/amity_uikit_beta_service.dart';
import 'package:amity_uikit_beta_service/viewmodel/amity_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_social_amity/app/data/providers/providers.dart';
import 'package:ui_social_amity/app/modules/auth/auth_view.dart';


class TabsView extends StatelessWidget {
  const TabsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer3<AuthViewModel, TabViewModel, AmityVM>(
      builder: (context, auth, vm, amityVM, child) {
        return amityVM.isLogin
            ? const Scaffold(
                body: CommunityView(),
              )
            : const AuthView();
      },
    );
  }
}
