import 'package:aula_03/app_routes.dart';
import 'package:aula_03/blocs/home_bloc/home_bloc.dart';
import 'package:aula_03/pages/cart_page/cart_page.dart';
import 'package:aula_03/pages/home_page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'pages/login_page/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider( // Injetor de Dependências
      create: (_) => HomeBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.yellowAccent,
            primary: Colors.blueGrey,
            secondary: Colors.blue,
          ),
          useMaterial3: true,
        ),
        initialRoute: AppRoutes.initial,
        routes: {
          AppRoutes.initial: (context) => const LoginPage(),
          AppRoutes.cartPage: (context) => const CartPage(),
        },
      ),
    );
  }
}
