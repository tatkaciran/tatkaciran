// ignore_for_file: avoid_print

import 'package:bloc/bloc.dart';

class SimpleBlocObserver extends BlocObserver {
  // @override
  // void onChange(BlocBase bloc, Object change) {
  //   print(bloc);
  //   print(change);
  //   super.onChange(bloc, change);
  // }

  @override
  void onClose(BlocBase bloc) {
    print(bloc);
    super.onClose(bloc);
  }

  @override
  void onCreate(BlocBase bloc) {
    print(bloc);
    super.onCreate(bloc);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    print(bloc);
    print(error);
    print(stackTrace);
    super.onError(bloc, error, stackTrace);
  }

  // @override
  // void onEvent(Bloc bloc, Object event) {
  //   print(bloc);
  //   print(event);
  //   super.onEvent(bloc, event);
  // }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    print(bloc);
    print(transition);
    super.onTransition(bloc, transition);
  }
}
