import 'package:flexihome/blocs/app/app_bloc.dart';
import 'package:flexihome/pages/home/HomePage.dart';
import 'package:flexihome/pages/login/LoginPage.dart';
import 'package:flexihome/repositories/AuthenticationRepository.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class App extends StatelessWidget {
  const App({
    Key? key,
    required AuthenticationRepository authenticationRepository,
  })  : _authenticationRepository = authenticationRepository,
        super(key: key);

  final AuthenticationRepository _authenticationRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _authenticationRepository,
      child: BlocProvider(
        create: (_) => AppBloc(
          authenticationRepository: _authenticationRepository,
        ),
        child: const AppView(),
      ),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        // theme: theme,
        title: "FlexiHome",
        home: FlowBuilder<AppStatus>(
          state: context.select((AppBloc bloc) => bloc.state.status),
          onGeneratePages: (appStatus, pages) {
            if (appStatus == AppStatus.authenticated)
              return [HomePage.page()];
            else
              return [LoginPage.page()];
          },
        ),
      );
    });
  }
}
