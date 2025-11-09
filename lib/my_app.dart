import 'package:flutter/material.dart';
import 'package:weather_app/core/app_constants.dart';
import 'package:weather_app/core/utils/themes/app_theams.dart';
import 'package:weather_app/features/common/common_screens/indexed_stack_nav_bar.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppConstants.appName,
      theme: AppTheams.mainTheme,
      home: const IndexedStackNavBar(),
    );
  }
}
