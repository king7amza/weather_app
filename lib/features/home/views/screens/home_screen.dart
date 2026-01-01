import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/shimmer_effect_widget.dart';
import 'package:weather_app/features/home/models/custom_weather_icons_model.dart';
import 'package:weather_app/features/home/views/widgets/carousel_highlights_widget.dart';
import 'package:weather_app/features/home/views_models/current_weather_cubit/current_weather_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CurrentWeatherCubit currentWeatherCubit = BlocProvider.of(context);
    final size = MediaQuery.sizeOf(context);
    return BlocBuilder<CurrentWeatherCubit, CurrentWeatherState>(
      bloc: currentWeatherCubit,
      buildWhen: (previous, current) =>
          current is CurrentWeatherLoading ||
          current is CurrentWeatherLoaded ||
          current is CurrentWeatherError,
      builder: (context, state) {
        if (state is CurrentWeatherLoading) {
          return const Center(child: ShimmerEffectWidget());
        } else if (state is CurrentWeatherError) {
          return Padding(
            padding: EdgeInsets.all(size.width * 0.1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.error,
                  size: size.width * 0.1,
                  color: Theme.of(context).colorScheme.error,
                ),
                Text(
                  state.message,
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    color: Theme.of(context).colorScheme.error,
                  ),
                ),
              ],
            ),
          );
        } else if (state is CurrentWeatherLoaded) {
          final currentWeather = state.currentWeatherResponse;
          return SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(
                        size.width * 0.1,
                        size.width * 0.1,
                        size.width * 0.1,
                        0,
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "${currentWeather.name}",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineLarge!
                                    .copyWith(
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.onPrimary,
                                    ),
                              ),
                            ],
                          ),
                          SizedBox(height: size.width * 0.06),
                          Column(
                            children: [
                              SizedBox(
                                width: size.width * 0.6,
                                height: size.width * 0.6,
                                child: Image.network(
                                  CustomWeatherIconsModel.getWeatherIcon(
                                    currentWeather.weather!.first.icon,
                                  ),
                                  fit: BoxFit.contain,
                                ),
                              ),
                              SizedBox(height: size.width * 0.04),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    ((currentWeather.main!.temp)! - 273.15)
                                        .toStringAsFixed(1),
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayLarge!
                                        .copyWith(
                                          color: Theme.of(
                                            context,
                                          ).colorScheme.onPrimary,
                                        ),
                                  ),
                                  Text(
                                    "°C",
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayLarge!
                                        .copyWith(
                                          color: Theme.of(
                                            context,
                                          ).colorScheme.tertiary,
                                        ),
                                  ),
                                ],
                              ),
                              SizedBox(height: size.width * 0.06),
                              Text(
                                "${currentWeather.weather!.first.main}",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineLarge!
                                    .copyWith(
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.onPrimary,
                                    ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.05),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.1,
                      ),
                      child: CarouselHighlightsWidget(
                        currentWeather: currentWeather,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return Center(
            child: Text(
              'Wow such empty !',
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                color: Theme.of(context).colorScheme.error,
              ),
            ),
          );
        }
      },
    );
  }
}