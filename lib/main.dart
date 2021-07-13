import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zignut_practicle/repository/login_repository.dart';
import 'package:zignut_practicle/screens/dashboard_screen.dart';
import 'package:zignut_practicle/screens/splash_screen.dart';

import 'bloc/dashboard/dashboard_bloc.dart';
import 'bloc/login_bloc.dart';
import 'constants/app_constants.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppConstants.prefs = await SharedPreferences.getInstance();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => LoginRepository()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<LoginBloc>(
              create: (BuildContext context) =>
                  LoginBloc(repository: context.read<LoginRepository>())),
          BlocProvider<DashboardBloc>(
              create: (BuildContext context) =>
                  DashboardBloc(repository: context.read<LoginRepository>())),

        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: SplashScreen(),
        ),
      ),
    );
  }
}