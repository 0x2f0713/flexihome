import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flexihome/app.dart';
import 'package:flexihome/blocs/AppBlocObserver.dart';
import 'package:flexihome/repositories/AuthenticationRepository.dart';
import 'package:flutter/widgets.dart';

Future<void> main() async {
  Bloc.observer = AppBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final authenticationRepository = AuthenticationRepository();
  await authenticationRepository.user.first;
  runApp(App(authenticationRepository: authenticationRepository));
}
