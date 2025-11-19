import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/common/common_screens/single_weather_shimmer_eff.dart';
import 'package:weather_app/features/home/models/custom_weather_icons_model.dart';
import 'package:weather_app/features/home/views_models/current_weather_cubit/current_weather_cubit.dart';
import 'package:weather_app/features/search/models/search_api_response.dart';

class WeatherHorizontalItem extends StatelessWidget {
  final Weather searchedCityDetails;
  const WeatherHorizontalItem({super.key, required this.searchedCityDetails});

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
          final currentWeather = state.currentWeatherResponse;
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Theme.of(context).colorScheme.secondary,
                border: Border.all(
                  color: Theme.of(context).colorScheme.onPrimary,
                  width: 1.5,
                ),
                gradient: LinearGradient(
                  colors: [
                    Theme.of(context).colorScheme.secondary,
                    Theme.of(context).colorScheme.primary,
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
              height: 150,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            searchedCityDetails.state ?? '',
                            style: Theme.of(context).textTheme.headlineSmall!
                                .copyWith(
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.onPrimary,
                                ),
                          ),
                          Text(
                            searchedCityDetails.name ?? '',
                            style: Theme.of(context).textTheme.headlineLarge!
                                .copyWith(
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.onPrimary,
                                ),
                          ),
                          Text(
                            currentWeather.weather![0].main ?? '',
                            style: Theme.of(context).textTheme.headlineSmall!
                                .copyWith(
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.onPrimary,
                                ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 130,
                            width: 140,
                            child: Image.network(
                              CustomWeatherIconsModel.getWeatherIcon(
                                currentWeather.weather![0].icon,
                              ),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        Text(
                          "${(currentWeather.main!.temp! - 273.15).toStringAsFixed(1)}°C",
                          style: Theme.of(context).textTheme.headlineSmall!
                              .copyWith(
                                color: Theme.of(context).colorScheme.onPrimary,
                              ),
                        ),
                      ],
                    ),
                  ],
                ),
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
