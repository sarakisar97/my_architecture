import 'package:flutter/material.dart';
import 'package:my_architecture/global/app_constants.dart';
import 'package:my_architecture/presentation/router/app_router.gr.dart';
import 'package:my_architecture/presentation/theme/app_theme.dart';
import 'package:my_architecture/presentation/views/home/home_screen.dart';

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