import 'package:flutter/material.dart';
import 'package:weather_app/core/app_constants.dart';
import 'package:weather_app/core/utils/themes/app_theams.dart';
import 'package:weather_app/features/common/common_screens/indexed_stack_nav_bar.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeData? currentTheme = AppThemes.primaryMode;

  void changeTheme(ThemeData selectedTheme) {
    setState(() {
      currentTheme = selectedTheme;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppConstants.appName,
      theme: currentTheme,
      home: IndexedStackNavBar(changeTheme: changeTheme),
    );
  }
}
