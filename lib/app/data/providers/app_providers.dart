import 'package:provider/provider.dart';

import 'providers.dart';

abstract class AppProviders {
  static final providers = [
    ChangeNotifierProvider<AuthViewModel>(
      create: (context) => AuthViewModel(context),
    ),
    ChangeNotifierProvider<TabViewModel>(
      create: (context) => TabViewModel(),
    ),
  ];
}
