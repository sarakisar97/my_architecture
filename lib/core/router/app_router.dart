import 'package:auto_route/auto_route.dart';
import '../../features/posts/presentation/screens/home/home_screen.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: HomeScreen, initial: true),
  ],
)
class $AppRouter {}