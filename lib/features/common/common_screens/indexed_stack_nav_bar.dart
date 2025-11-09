import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/utils/themes/app_colors.dart';
import 'package:weather_app/features/home/views/screens/home_screen.dart';
import 'package:weather_app/features/home/views_models/current_weather_cubit/current_weather_cubit.dart';
import 'package:weather_app/features/profile/views/screens/profile_screen.dart';
import 'package:weather_app/features/search/view_models/search_cubit/search_cubit.dart';
import 'package:weather_app/features/search/views/screens/search_screen.dart';

class IndexedStackNavBar extends StatefulWidget {
  const IndexedStackNavBar({super.key});

  @override
  State<IndexedStackNavBar> createState() => IndexedStackNavBarState();
}

class IndexedStackNavBarState extends State<IndexedStackNavBar> {
  int currentIndex = 0;

  void onTapChangeScreen(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            final currentWeatherCubit = CurrentWeatherCubit();
            currentWeatherCubit.getCurrentWeather();
            return currentWeatherCubit;
          },
        ),
        BlocProvider(create: (context) => SearchCubit()),
      ],
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [AppColors.primaryColor, AppColors.secondaryColor],
          ),
        ),
        child: Scaffold(
          extendBodyBehindAppBar: currentIndex == 1 ? true : false,
          appBar: currentIndex == 1
              ? AppBar(
                  backgroundColor: AppColors.transparent,
                  title: Text(
                    'Search',
                    style: Theme.of(
                      context,
                    ).textTheme.headlineLarge!.copyWith(color: AppColors.white),
                  ),
                  centerTitle: true,
                  elevation: 0,
                )
              : null,
          resizeToAvoidBottomInset: false,
          backgroundColor: AppColors.transparent,
          body: IndexedStack(
            index: currentIndex,
            children: [
              const HomeScreen(),
              const SearchScreen(),
              const ProfileScreen(),
            ],
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: BottomNavigationBar(
                currentIndex: currentIndex,
                onTap: onTapChangeScreen,
                backgroundColor: AppColors.white,
                unselectedItemColor: AppColors.grey,
                selectedItemColor: AppColors.primaryColor,
                unselectedFontSize: 12,
                selectedFontSize: 16,
                unselectedIconTheme: const IconThemeData(
                  color: AppColors.grey,
                  size: 25,
                ),
                selectedIconTheme: const IconThemeData(
                  color: AppColors.primaryColor,
                  size: 35,
                ),
                type: BottomNavigationBarType.fixed,
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.search),
                    label: 'Search',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person),
                    label: 'Profile',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
