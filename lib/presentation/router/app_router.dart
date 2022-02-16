import 'package:auto_route/auto_route.dart';
import 'package:my_architecture/presentation/views/home/home_screen.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: HomeScreen, initial: true),
  ],
)
class $AppRouter {}