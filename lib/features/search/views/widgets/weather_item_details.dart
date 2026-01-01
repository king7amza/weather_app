import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/utils/themes/app_colors.dart';
import 'package:weather_app/core/weather_shimmer_effect_widget.dart';
import 'package:weather_app/features/home/models/custom_weather_icons_model.dart';
import 'package:weather_app/features/home/views/widgets/carousel_highlights_widget.dart';
import 'package:weather_app/features/home/views_models/current_weather_cubit/current_weather_cubit.dart';
import 'package:weather_app/features/search/models/search_api_response.dart';

class WeatherItemDetails extends StatelessWidget {
  final Weather? cityDetails;
  const WeatherItemDetails({super.key, this.cityDetails});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final currentWeatherCubit = BlocProvider.of<CurrentWeatherCubit>(context);
    return Container(
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
        appBar: AppBar(
          backgroundColor: AppColors.transparent,
          title: Text(
            '${cityDetails?.name} Weather',
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
          leading: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              border: Border.all(
                color: Theme.of(context).colorScheme.onPrimary,
                width: 1.5,
              ),
              color: Theme.of(context).colorScheme.primary,
            ),
            child: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          centerTitle: true,
          elevation: 0,
        ),
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.transparent,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.05,
                      vertical: size.height * 0.03,
                    ),
                    child: BlocBuilder<CurrentWeatherCubit, CurrentWeatherState>(
                      bloc: currentWeatherCubit,
                      buildWhen: (previous, current) =>
                          current is CurrentWeatherLoaded ||
                          current is CurrentWeatherError ||
                          current is CurrentWeatherLoading,
                      builder: (context, state) {
                        if (state is CurrentWeatherLoading) {
                          return const Center(child: WeatherShimmerEffectWidget());
                        } else if (state is CurrentWeatherLoaded) {
                          final currentWeather = state.currentWeatherResponse;
                          return Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: size.height * 0.03,
                            ),
                            child: Column(
                              children: [
                                Image.network(
                                  CustomWeatherIconsModel.getWeatherIcon(
                                    currentWeather.weather![0].icon,
                                  ),
                                  height: size.width * 0.45,
                                  width: size.width * 0.45,
                                  fit: BoxFit.contain,
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      (currentWeather.main!.temp! - 273.15)
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
                              ],
                            ),
                          );
                        } else if (state is CurrentWeatherError) {
                          return Text(state.message);
                        }
                        return Container();
                      },
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.1, 
                      vertical: size.height * 0.02,
                    ),
                    child: Column(
                      children: [
                        cityDetails?.localNames?["zh"] == null &&
                                cityDetails?.localNames?["en"] == null &&
                                cityDetails?.localNames?["ar"] == null
                            ? const SizedBox.shrink()
                            : Container(
                                width: double.infinity,
                                height: size.height * 0.18, 
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  gradient: LinearGradient(
                                    colors: [
                                      Theme.of(context).colorScheme.secondary,
                                      Theme.of(context).colorScheme.primary,
                                    ],
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Names of the city",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall!
                                          .copyWith(
                                            color: Theme.of(
                                              context,
                                            ).colorScheme.onPrimary,
                                          ),
                                    ),
                                    SizedBox(height: size.height * 0.01),
                                    Wrap(
                                      alignment: WrapAlignment.center,
                                      spacing: size.width * 0.02,
                                      children: [
                                        Text(
                                          "(${cityDetails?.localNames?["en"] ?? ""}",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineSmall!
                                              .copyWith(
                                                color: Theme.of(
                                                  context,
                                                ).colorScheme.onPrimary,
                                              ),
                                        ),
                                        Text(
                                          "${cityDetails?.localNames?["ar"]}",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineSmall!
                                              .copyWith(
                                                color: Theme.of(
                                                  context,
                                                ).colorScheme.onPrimary,
                                              ),
                                        ),
                                        Text(
                                          "${cityDetails?.localNames?["zh"] ?? ""})",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineSmall!
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
                        SizedBox(height: size.height * 0.02),
                        BlocBuilder<CurrentWeatherCubit, CurrentWeatherState>(
                          bloc: currentWeatherCubit,
                          buildWhen: (previous, current) =>
                              current is CurrentWeatherLoaded ||
                              current is CurrentWeatherError ||
                              current is CurrentWeatherLoading,
                          builder: (context, state) {
                            if (state is CurrentWeatherLoading) {
                              return const Center(
                                child: WeatherShimmerEffectWidget(),
                              );
                            } else if (state is CurrentWeatherLoaded) {
                              final currentWeather = state.currentWeatherResponse;
                              return CarouselHighlightsWidget(
                                currentWeather: currentWeather,
                              );
                            } else if (state is CurrentWeatherError) {
                              return Text(state.message);
                            }
                            return Container();
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}