import 'package:coresolutions/pages/login/bloc/login_bloc.dart';
import 'package:coresolutions/pages/login/login_page.dart';
import 'package:coresolutions/pages/natures_create/bloc/nature_create_bloc.dart';
import 'package:coresolutions/pages/natures_list/bloc/natures_bloc.dart';
import 'package:coresolutions/repository/repository.dart';
import 'package:coresolutions/routes/routes.dart';
import 'package:flutter/material.dart';

import 'package:coresolutions/themes/theme_dark.dart';
import 'package:coresolutions/themes/theme_light.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MultiBlocProvider(providers: [
    BlocProvider<LoginBloc>(
      create: (BuildContext context) => LoginBloc(Repository()),
    ),
    BlocProvider<NaturesBloc>(
      create: (BuildContext context) => NaturesBloc(Repository()),
    ),
    BlocProvider<NatureCreateBloc>(
      create: (BuildContext context) => NatureCreateBloc(Repository()),
    )
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: AppRoutes.routesArray,
      theme: ThemeData(
          useMaterial3: true, colorScheme: lightColorScheme.colorScheme),
      darkTheme: ThemeData(
          useMaterial3: true, colorScheme: darkColorScheme.colorScheme),
      home: LoginPage(),
    );
  }
}
