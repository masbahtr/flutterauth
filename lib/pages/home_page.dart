import 'package:flutter/material.dart';
import 'package:flutterauth/bloc/login_bloc.dart';
import 'package:flutterauth/routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        actions: [
          BlocConsumer<LoginBloc, LoginState>(
            listener: (context, state) {
              if (state is LogoutSuccess) {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  MyRoute.login.name,
                  (_) => false,
                );
              }
            },
            builder: (context, state) {
              if (state is LogoutLoading) {
                return CircularProgressIndicator(color: Colors.blueAccent);
              }
              return IconButton(
                onPressed: () => context.read<LoginBloc>().add(Logout()),
                icon: Icon(Icons.logout),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Text('Welcome to Home Page', style: TextStyle(fontSize: 18)),
      ),
    );
  }
}
