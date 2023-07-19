import 'package:amity_uikit_beta_service/amity_uikit_beta_service.dart';
import 'package:amity_uikit_beta_service/viewmodel/configuration_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_social_amity/app/constants/colors.dart';
import 'data/providers/app_providers.dart';
import 'modules/tabs/tabs_view.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return AmitySLEProvider(
      child: Builder(builder: (context2) {

        AmitySLEUIKit.configAmityThemeColor(context2, (config) {
          config.primaryColor = AppColors.primary;
          config.appbarConfig = AppbarConfig(
            backgroundColor: AppColors.primary,
            textColor: Colors.white,
            iconBackColor: Colors.white,
          );
          config.buttonConfig = ButtonConfig(
            backgroundColor: AppColors.primary,
            textColor: Colors.white,
          );
        });
        
        return MultiProvider(
          providers: AppProviders.providers,
          child: SafeArea(
            child: MaterialApp(
              navigatorKey: NavigationService.navigatorKey,
              title: 'Social Amity',          
              theme: ThemeData(
                primaryColor: AppColors.primary,
                secondaryHeaderColor: AppColors.secondary,
                appBarTheme: const AppBarTheme(
                  backgroundColor: AppColors.primary,
                )
              ),
              debugShowCheckedModeBanner: false,
              home: const TabsView(),
            ),
          ),
        );
      }),
    );
  }
}