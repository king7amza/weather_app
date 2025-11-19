import 'package:flutter/material.dart';
import 'package:weather_app/features/home/models/current_weather_response_model.dart';

class CarouselHighlightsCases {
  static List<TodaysHighlightsWidget> generateHighlights(
    CurrentWeatherResponseModel currentWeather,
  ) {
    List<TodaysHighlightsWidget> highlights = [];
    if (currentWeather.main?.temp != null) {
      highlights.add(
        TodaysHighlightsWidget(
          title: "Temperature",
          iconPath: "assets/images/temprature_icon.png",
          mainvalue:
              "${((currentWeather.main!.temp)! - 273.15).toStringAsFixed(1)} °C",
          secondvalue: currentWeather.main!.tempMax == null
              ? ""
              : "${(currentWeather.main!.tempMax)! - 273.15} °C",
          thirdvalue: currentWeather.main!.tempMin == null
              ? ""
              : "${(currentWeather.main!.tempMin)! - 273.15} °C",
        ),
      );
    }
    if (currentWeather.wind?.speed != null) {
      highlights.add(
        TodaysHighlightsWidget(
          title: "Wind",
          iconPath: "assets/images/wind_icon.png",
          mainvalue: "${currentWeather.wind!.speed} m/s",
          secondvalue: "Gust",
          thirdvalue: "${currentWeather.wind!.gust} m/s",
        ),
      );
    }

    if (currentWeather.main?.humidity != null) {
      highlights.add(
        TodaysHighlightsWidget(
          title: "Humidity",
          iconPath: "assets/images/humidity_icon.png",
          mainvalue: "${currentWeather.main!.humidity} %",
          secondvalue: "Pressure",
          thirdvalue: "${currentWeather.main!.pressure} hPa",
        ),
      );
    }
    return highlights;
  }
}

class TodaysHighlightsWidget extends StatelessWidget {
  final String? title;
  final String? iconPath;
  final String? mainvalue;
  final String? secondvalue;
  final String? thirdvalue;
  const TodaysHighlightsWidget({
    super.key,
    this.title,
    this.iconPath,
    this.mainvalue,
    this.secondvalue,
    this.thirdvalue,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      width: size.width * 0.8,
      height: size.height * 0.26,
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: size.width * 0.2,
                height: size.width * 0.2,
                child: Image.asset(iconPath!, fit: BoxFit.contain),
              ),
              title == null
                  ? SizedBox.shrink()
                  : Text(
                      title!,
                      style: Theme.of(context).textTheme.headlineLarge!
                          .copyWith(
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                    ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              secondvalue == null
                  ? SizedBox.shrink()
                  : Text(
                      secondvalue!,
                      style: Theme.of(context).textTheme.headlineSmall!
                          .copyWith(
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                    ),
              thirdvalue == null
                  ? SizedBox.shrink()
                  : Text(
                      thirdvalue!,
                      style: Theme.of(context).textTheme.headlineSmall!
                          .copyWith(
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                    ),
            ],
          ),
          SizedBox(height: size.width * 0.06),
          mainvalue == null
              ? SizedBox.shrink()
              : Text(
                  mainvalue!,
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
        ],
      ),
    );
  }
}
