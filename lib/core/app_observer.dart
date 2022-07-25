import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

class AppObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    if(kDebugMode){
      print('${bloc.runtimeType} $change');
    }
  }
}