import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:my_architecture/dependency_injection.dart';
import 'package:my_architecture/presentation/cubit/app_observer.dart';
import 'package:my_architecture/presentation/views/app.dart';

void main() {
  setup();
  BlocOverrides.runZoned(() => runApp(App()), blocObserver: AppObserver());
}
