import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/utils/themes/app_colors.dart';
import 'package:weather_app/features/common/common_screens/single_weather_shimmer_eff.dart';
import 'package:weather_app/features/home/models/custom_weather_icons_model.dart';
import 'package:weather_app/features/home/views_models/current_weather_cubit/current_weather_cubit.dart';
import 'package:weather_app/features/search/models/search_api_response.dart';

class WeatherHorizontalItem extends StatelessWidget {
  final Weather searchedCityWeather;
  const WeatherHorizontalItem({super.key, required this.searchedCityWeather});

  @override
  Widget build(BuildContext context) {
    final currentWeatherCubit = BlocProvider.of<CurrentWeatherCubit>(context);
    return BlocBuilder<CurrentWeatherCubit, CurrentWeatherState>(
      bloc: currentWeatherCubit,
      buildWhen: (previous, current) =>
          current is CurrentWeatherLoaded ||
          current is CurrentWeatherError ||
          current is CurrentWeatherLoading,
      builder: (context, state) {
        if (state is CurrentWeatherLoading) {
          return const Center(child: SingleWeatherShimmerEff());
        } else if (state is CurrentWeatherLoaded) {
          final currentWeather = state.currentWeatherResponse.weather![0];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: AppColors.secondaryColor,
                border: Border.all(color: AppColors.white, width: 1.5),
                gradient: LinearGradient(
                  colors: [AppColors.secondaryColor, AppColors.primaryColor],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
              height: 140,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        searchedCityWeather.state ?? '',
                        style: Theme.of(context).textTheme.headlineSmall!
                            .copyWith(color: AppColors.white),
                      ),
                      Text(
                        searchedCityWeather.name ?? '',
                        style: Theme.of(context).textTheme.headlineLarge!
                            .copyWith(color: AppColors.white),
                      ),
                      Text(
                        currentWeather.main ?? '',
                        style: Theme.of(context).textTheme.headlineSmall!
                            .copyWith(color: AppColors.white),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 150,
                    height: 180,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Image.network(
                        CustomWeatherIconsModel.getWeatherIcon(
                          currentWeather.icon,
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        } else if (state is CurrentWeatherError) {
          return Text(state.message);
        }
        return Container();
      },
    );
  }
}
