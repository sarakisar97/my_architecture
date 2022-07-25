import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:my_architecture/injection_container.dart';
import 'core/app_constants.dart';
import 'core/app_observer.dart';
import 'core/router/app_router.gr.dart';
import 'core/theme/app_theme.dart';

void main() {
  setup();
  BlocOverrides.runZoned(() => runApp(App()), blocObserver: AppObserver());
}

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);
  final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: AppConstants.appTitle,
      theme: AppTheme.lightTheme,
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(includePrefixMatches: true),
    );
  }
}
