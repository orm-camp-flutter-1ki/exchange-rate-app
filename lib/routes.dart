import 'package:currency_exchange/ui/main/main_screen.dart';
import 'package:go_router/go_router.dart';

import 'di/di_setup.dart';
import 'ui/main/main_view_model.dart';
import 'package:provider/provider.dart';

// GoRouter configuration
final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => ChangeNotifierProvider(
        create: (_) => getIt<MainViewModel>(),
        child: MainScreen(),
      ),
    ),
  ],
);
