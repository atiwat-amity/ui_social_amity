import 'package:amity_uikit_beta_service/amity_uikit_beta_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:ui_social_amity/app/application.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  AmitySLEUIKit.initUIKit(
      "b3babb0b3a89f4341d31dc1a01091edcd70f8de7b23d697f", "sg");
  Brightness brightness =
      SchedulerBinding.instance.platformDispatcher.platformBrightness;
  bool isDarkMode = brightness == Brightness.dark;
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarIconBrightness: isDarkMode ? Brightness.light:Brightness.dark,
      statusBarBrightness: isDarkMode ? Brightness.light:Brightness.dark,
    ),
  );
  runApp(const Application());
}
