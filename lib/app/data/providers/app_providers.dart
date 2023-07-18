import 'package:provider/provider.dart';

import 'providers.dart';

abstract class AppProviders {
  static final providers = [
    ChangeNotifierProvider<AuthViewModel>(
      create: (context) => AuthViewModel(),
    ),
    ChangeNotifierProvider<TabViewModel>(
      create: (context) => TabViewModel(),
    ),
  ];
}
