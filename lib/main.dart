import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterauth/bloc/login_bloc.dart';
import 'package:flutterauth/routes.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => LoginBloc())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: MyRoute.login.name,
        routes: routes,
      ),
    );
  }
}
