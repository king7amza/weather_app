import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/app_constants.dart';
import 'package:weather_app/core/indexed_stack_nav_bar.dart';
import 'package:weather_app/core/set_new_theme_cubit/set_new_theme_cubit.dart';
import 'package:weather_app/core/utils/themes/app_theams.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) {
        final themeCubit = SetNewThemeCubit();
        themeCubit.getCurrentTheme();
        return themeCubit;
      },
      child: BlocBuilder<SetNewThemeCubit, SetNewThemeState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: AppConstants.appName,
            theme: state is GetCurrentTheme
                ? state.currentTheme
                : AppThemes.primaryMode,
            home: IndexedStackNavBar(),
          );
        },
      ),
    );
  }
}
