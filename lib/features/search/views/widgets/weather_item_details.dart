import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/utils/themes/app_colors.dart';
import 'package:weather_app/features/common/common_screens/single_weather_shimmer_eff.dart';
import 'package:weather_app/features/home/models/custom_weather_icons_model.dart';
import 'package:weather_app/features/home/views/widgets/carousel_highlights_widget.dart';
import 'package:weather_app/features/home/views_models/current_weather_cubit/current_weather_cubit.dart';
import 'package:weather_app/features/search/models/search_api_response.dart';

class WeatherItemDetails extends StatelessWidget {
  final Weather? cityDetails;
  const WeatherItemDetails({super.key, this.cityDetails});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
        body: Stack(
          children: [
            Positioned(
              top: 160,
              left: 40,
              right: 40,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                child: BlocBuilder<CurrentWeatherCubit, CurrentWeatherState>(
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
                        child: Column(
                          children: [
                            Image.network(
                              CustomWeatherIconsModel.getWeatherIcon(
                                currentWeather.weather![0].icon,
                              ),
                              height: 180,
                              width: 180,
                              fit: BoxFit.contain,
                            ),
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
            Positioned(
              bottom: 1,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  color: AppColors.white,
                ),
                height: 500,
                width: size.width,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20,
                  ),
                  child: Column(
                    children: [
                      cityDetails?.localNames?["zh"] == null &&
                              cityDetails?.localNames?["en"] == null &&
                              cityDetails?.localNames?["ar"] == null
                          ? Container()
                          : Container(
                              width: double.infinity,
                              height: 150,
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
                                        .headlineLarge!
                                        .copyWith(
                                          color: Theme.of(
                                            context,
                                          ).colorScheme.onPrimary,
                                        ),
                                  ),
                                  const SizedBox(height: 17),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "( ${(cityDetails?.localNames?["en"] ?? "")} , ",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineSmall!
                                            .copyWith(
                                              color: Theme.of(
                                                context,
                                              ).colorScheme.onPrimary,
                                            ),
                                      ),
                                      const SizedBox(width: 10),
                                      Text(
                                        "${cityDetails?.localNames?["ar"] ?? ""} , ",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineSmall!
                                            .copyWith(
                                              color: Theme.of(
                                                context,
                                              ).colorScheme.onPrimary,
                                            ),
                                      ),
                                      const SizedBox(width: 10),
                                      Text(
                                        "${cityDetails?.localNames?["zh"] ?? ""} )",
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
                      const SizedBox(height: 20),
                      BlocBuilder<CurrentWeatherCubit, CurrentWeatherState>(
                        bloc: currentWeatherCubit,
                        buildWhen: (previous, current) =>
                            current is CurrentWeatherLoaded ||
                            current is CurrentWeatherError ||
                            current is CurrentWeatherLoading,
                        builder: (context, state) {
                          if (state is CurrentWeatherLoading) {
                            return const Center(
                              child: SingleWeatherShimmerEff(),
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
            ),
          ],
        ),
      ),
    );
  }
}
