import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/utils/themes/app_colors.dart';
import 'package:weather_app/features/home/views/screens/home_screen.dart';
import 'package:weather_app/features/home/views/widgets/theme_drawer.dart';
import 'package:weather_app/features/home/views_models/current_weather_cubit/current_weather_cubit.dart';
import 'package:weather_app/features/search/view_models/search_cubit/search_cubit.dart';
import 'package:weather_app/features/search/views/screens/search_screen.dart';

class IndexedStackNavBar extends StatefulWidget {
  final void Function(String) changeTheme;
  const IndexedStackNavBar({super.key, required this.changeTheme});

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
            colors: [
              Theme.of(context).colorScheme.primary,
              Theme.of(context).colorScheme.secondary,
            ],
          ),
        ),
        child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: currentIndex == 0
              ? AppBar(
                  backgroundColor: AppColors.transparent,
                  elevation: 0,
                  leading: Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Builder(
                      builder: (context) {
                        return IconButton(
                          onPressed: () {
                            Scaffold.of(context).openDrawer();
                          },
                          icon: Icon(
                            Icons.color_lens,
                            size: 30,
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                        );
                      },
                    ),
                  ),
                )
              : AppBar(
                  backgroundColor: AppColors.transparent,
                  title: Text(
                    'Search',
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                  centerTitle: true,
                  elevation: 0,
                ),
          resizeToAvoidBottomInset: false,
          backgroundColor: AppColors.transparent,
          drawer: currentIndex == 0 ? ThemeDrawer(changeTheme: widget.changeTheme,) : null,
          body: IndexedStack(
            index: currentIndex,
            children: [const HomeScreen(), const SearchScreen()],
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: BottomNavigationBar(
                currentIndex: currentIndex,
                onTap: onTapChangeScreen,
                backgroundColor: Theme.of(context).colorScheme.primary,
                unselectedItemColor: Theme.of(context).colorScheme.onSurface,
                selectedItemColor: Theme.of(context).colorScheme.onPrimary,
                unselectedFontSize: 12,
                selectedFontSize: 16,
                unselectedIconTheme: IconThemeData(
                  color: Theme.of(context).colorScheme.onSurface,
                  size: 25,
                ),
                selectedIconTheme: IconThemeData(
                  color: Theme.of(context).colorScheme.onPrimary,
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
