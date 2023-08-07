import 'package:amity_uikit_beta_service/amity_uikit_beta_service.dart';
import 'package:amity_uikit_beta_service/view/social/community_tabbar.dart';
import 'package:amity_uikit_beta_service/viewmodel/amity_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_social_amity/app/constants/colors.dart';
import 'package:ui_social_amity/app/data/providers/providers.dart';
import 'package:ui_social_amity/app/modules/auth/auth_view.dart';

import '../user_profile/user_profile.dart';

class TabsView extends StatelessWidget {
  const TabsView({super.key});
  
  @override
  Widget build(BuildContext context) {
    
    return Consumer3<AuthViewModel, TabViewModel, AmityVM>(
      builder: (context, auth, vm, amityVM, child) {
        const list = [CommunityView(),  CommunityTabbar(), UserProfileView(openTabView: false,),];
        return amityVM.isLogin ? Scaffold(
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
            onTap: (index){
              if(index == 2){
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const UserProfileView(openTabView: false),
                    ));
              }else{
                vm.selectTab(index);
              }
            },
            showSelectedLabels: false,
            showUnselectedLabels: false,
            unselectedItemColor: Colors.grey,
            selectedItemColor: AppColors.secondary,
            backgroundColor: AppColors.primary,
          ),
        ): const AuthView();
      },
    );
  }
}
