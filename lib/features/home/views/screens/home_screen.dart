import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/utils/themes/app_colors.dart';
import 'package:weather_app/features/common/common_screens/common_shimmer_eff.dart';
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
          return const Center(child: CommonShimmerEff());
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
          return SafeArea(
            child: SingleChildScrollView(
              child: Container(
                width: size.width,
                height: size.height,
                color: AppColors.transparent,
                child: Stack(
                  children: [
                    Positioned(
                      top: size.width * 0.1,
                      left: size.width * 0.1,
                      right: size.width * 0.1,
                      child: Column(
                        children: [
                          Container(
                            width: size.width * 0.7,
                            height: size.height * 0.07,
                            decoration: BoxDecoration(
                              color: AppColors.secondaryColor,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Center(
                              child: Text(
                                "${currentWeather.name}",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineLarge!
                                    .copyWith(color: AppColors.white),
                              ),
                            ),
                          ),
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                ((currentWeather.main!.temp)! - 273.15)
                                    .toStringAsFixed(1),
                                style: Theme.of(context).textTheme.displayLarge!
                                    .copyWith(color: AppColors.white),
                              ),
                              Text(
                                "°C",
                                style: Theme.of(context).textTheme.displayLarge!
                                    .copyWith(color: AppColors.gold),
                              ),
                            ],
                          ),
                          SizedBox(height: size.width * 0.06),
                          Text(
                            "${currentWeather.weather!.first.main}",
                            style: Theme.of(context).textTheme.headlineLarge!
                                .copyWith(color: AppColors.white),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: size.height * 0.6,
                      left: size.width * 0.05,
                      right: size.width * 0.05,
                      child: Text(
                        "Today’s Highlights",
                        style: Theme.of(context).textTheme.headlineLarge!
                            .copyWith(color: AppColors.white),
                      ),
                    ),
                    Positioned(
                      top: size.height * 0.66,
                      left: size.width * 0.1,
                      right: size.width * 0.1,
                      child: SizedBox(
                        height: size.height * 0.26,
                        width: size.width,
                        child: CarouselHighlightsWidget(
                          currentWeather: currentWeather,
                        ),
                      ),
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

/*
CarouselSlider(
  options: CarouselOptions(height: 400.0),
  items: [1,2,3,4,5].map((i) {
    return Builder(
      builder: (BuildContext context) {
        return Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.symmetric(horizontal: 5.0),
          decoration: BoxDecoration(
            color: Colors.amber
          ),
          child: Text('text $i', style: TextStyle(fontSize: 16.0),)
        );
      },
    );
  }).toList(),
)
 */
