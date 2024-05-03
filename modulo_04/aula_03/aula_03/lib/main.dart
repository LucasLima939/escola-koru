import 'package:flutter/material.dart';
import 'pages/home_page/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Roboto',
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF048C5A),
          primary: const Color(0xFF048C5A),
          secondary: const Color(0xFF0CC13E),
        ),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
