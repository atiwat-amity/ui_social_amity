import 'package:amity_uikit_beta_service/view/social/community_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_social_amity/app/constants/colors.dart';
import 'package:ui_social_amity/app/data/providers/providers.dart';
import 'package:ui_social_amity/app/modules/auth/auth_view.dart';

import '../feed/feed_view.dart';
import '../user_profile/user_profile.dart';

class TabsView extends StatelessWidget {
  const TabsView({super.key});
  
  @override
  Widget build(BuildContext context) {
    
    return Consumer2<AuthViewModel, TabViewModel>(
      builder: (context, auth, vm, child) {
        const list = [FeedView(),  CommunityTabbar(), UserProfileView(),];
        return auth.state.isLogin ? Scaffold(
          body: list[vm.state.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            items: [
              ...List.generate(vm.items.length, (index) {
                return BottomNavigationBarItem(
                  icon: vm.items[index].icon,
                  label: vm.items[index].label,
                );
              }),
            ],
            currentIndex: vm.state.currentIndex,
            onTap: vm.selectTab,
            unselectedItemColor: Colors.grey,
            selectedItemColor: AppColors.secondary,
            backgroundColor: AppColors.primary,
          ),
        ): const AuthView();
      },
    );
  }
}
