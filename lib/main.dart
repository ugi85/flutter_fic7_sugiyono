import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fic7_sugiyono/bloc/login/login_bloc.dart';
import 'package:flutter_fic7_sugiyono/bloc/logout/logout_bloc.dart';
import 'package:flutter_fic7_sugiyono/bloc/register/register_bloc.dart';
import 'package:flutter_fic7_sugiyono/pages/auth/auth_page.dart';
import 'package:flutter_fic7_sugiyono/utils/light_themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => RegisterBloc(),
        ),
        BlocProvider(
          create: (context) => LoginBloc(),
        ),
        BlocProvider(
          create: (context) => LogoutBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: light,
        home: const AuthPage(),
      ),
    );
  }
}
