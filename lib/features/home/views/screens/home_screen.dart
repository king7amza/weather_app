import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/utils/themes/app_colors.dart';
import 'package:weather_app/features/common/common_screens/shimmer_eff.dart';
import 'package:weather_app/features/home/models/custom_weather_icons_model.dart';
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
          return const Center(child: ShimmerEff());
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
                  color: AppColors.errorColor,
                ),
                Text(
                  state.message,
                  style: Theme.of(
                    context,
                  ).textTheme.headlineLarge!.copyWith(color: AppColors.white),
                ),
              ],
            ),
          );
        } else if (state is CurrentWeatherLoaded) {
          final currentWeather = state.currentWeatherResponse;
          debugPrint(" icon = ${currentWeather.weather!.first.icon}");
          return SafeArea(
            child: Padding(
              padding: EdgeInsets.only(
                left: size.width * 0.05,
                right: size.width * 0.05,
                top: size.width * 0.1,
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text(
                      "${currentWeather.name}",
                      style: Theme.of(context).textTheme.headlineLarge!
                          .copyWith(color: AppColors.white),
                    ),
                    SizedBox(height: size.width * 0.1),
                    SizedBox(
                      width: size.width * 0.7,
                      height: size.width * 0.7,
                      child: Image.network(
                        CustomWeatherIconsModel.getWeatherIcon(
                          currentWeather.weather!.first.icon,
                        ),
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(height: size.width * 0.1),
                    Text(
                      "${((currentWeather.main!.temp)! - 273.15).toStringAsFixed(1)} °C",
                      style: Theme.of(context).textTheme.displayLarge!.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                    SizedBox(height: size.width * 0.06),
                    Text(
                      "${currentWeather.weather!.first.main}",
                      style: Theme.of(context).textTheme.headlineLarge!
                          .copyWith(color: AppColors.white),
                    ),
                    SizedBox(height: size.width * 0.06),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            currentWeather.main!.tempMax == null
                                ? SizedBox.shrink()
                                : Text(
                                    "Max : ${currentWeather.main!.tempMax} °C",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall!
                                        .copyWith(color: AppColors.white),
                                  ),
                            currentWeather.main!.tempMin == null
                                ? SizedBox.shrink()
                                : Text(
                                    "Min : ${currentWeather.main!.tempMin} °C",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall!
                                        .copyWith(color: AppColors.white),
                                  ),
                          ],
                        ),
                        SizedBox(height: size.width * 0.06),
                        Text(
                          "Wind : ${currentWeather.wind!.speed} m/s",
                          style: Theme.of(context).textTheme.headlineSmall!
                              .copyWith(color: AppColors.white),
                        ),
                        SizedBox(height: size.width * 0.06),
                        Text(
                          "Humidity : ${currentWeather.main!.humidity} %",
                          style: Theme.of(context).textTheme.headlineSmall!
                              .copyWith(color: AppColors.white),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        } else {
          return Center(
            child: Text(
              'Wow such empty !',
              style: Theme.of(
                context,
              ).textTheme.headlineLarge!.copyWith(color: AppColors.white),
            ),
          );
        }
      },
    );
  }
}
