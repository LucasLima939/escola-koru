import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:openstreetmap/adapters/firebase_adapter.dart';
import 'package:openstreetmap/adapters/location_adapter.dart';
import 'package:openstreetmap/adapters/shared_preferences_adapter.dart';
import 'package:openstreetmap/blocs/home_bloc.dart';
import 'package:openstreetmap/firebase_options.dart';
import 'package:openstreetmap/repository/home_repository_impl.dart';

import 'pages/home_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final homeBloc = HomeBloc(HomeRepositoryImpl(LocationAdapter(), SharedPreferencesAdapter(), FirebaseAdapter()));
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(bloc: homeBloc),
    );
  }
}
