import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:netflix_app/login/presentation/utils/app_colors.dart';

import 'core_module.dart';

void main() {
  runApp(ModularApp(module: CoreModule(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        iconTheme: const IconThemeData(color: AppColors.textGreySecondary),
        scaffoldBackgroundColor: const Color(0xFF000000),
        appBarTheme: const AppBarTheme(backgroundColor: Color(0xFF000000)),
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.textGreySecondary,
        ),
        primaryColor: AppColors.textGreySecondary,
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      routerConfig: Modular.routerConfig,
    );
  }
}
