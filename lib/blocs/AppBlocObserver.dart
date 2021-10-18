import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    print('${bloc.runtimeType} CHANGE: $change');
    super.onChange(bloc, change);
  }

  @override
  void onClose(BlocBase bloc) {
    print('${bloc.runtimeType} closed');
    super.onClose(bloc);
  }

  @override
  void onCreate(BlocBase bloc) {
    print('${bloc.runtimeType} created');
    super.onCreate(bloc);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    print('${bloc.runtimeType} ERROR: $error $stackTrace');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    print('${bloc.runtimeType} EVENT: $event');
    super.onEvent(bloc, event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    print('${bloc.runtimeType} $transition');
    super.onTransition(bloc, transition);
  }
}
