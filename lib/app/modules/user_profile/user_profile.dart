import 'package:amity_uikit_beta_service/view/user/user_profile.dart';
import 'package:amity_uikit_beta_service/viewmodel/amity_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserProfileView extends StatelessWidget {
  const UserProfileView({
    super.key,
    this.openTabView = true,
  });
  final bool openTabView;
  @override
  Widget build(BuildContext context) {
    final user = context.watch<AmityVM>().currentamityUser;
    if (user == null) {
      return const SizedBox();
    }
    return UserProfileScreen(
      amityUser: user,
    );
  }
}
