import 'package:aula_03/blocs/home_bloc/home_bloc.dart';
import 'package:aula_03/pages/cart_page/cart_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'pages/home_page/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Roboto',
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.yellowAccent,
            primary: Colors.blueGrey,
            secondary: Colors.blue,
          ),
          useMaterial3: true,
        ),
        initialRoute: '/',
        routes: {
          // When navigating to the "/" route, build the FirstScreen widget.
          '/': (context) => const HomePage(),
          // When navigating to the "/second" route, build the SecondScreen widget.
          '/cart': (context) => const CartPage(),
        },
      ),
    );
  }
}
