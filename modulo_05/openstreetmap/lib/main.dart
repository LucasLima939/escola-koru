import 'package:flutter/material.dart';
import 'package:openstreetmap/adapters/location_adapter.dart';
import 'package:openstreetmap/blocs/home_bloc.dart';
import 'package:openstreetmap/repository/home_repository_impl.dart';

import 'pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(
        bloc: HomeBloc(HomeRepositoryImpl(LocationAdapter())),
      ),
    );
  }
}
