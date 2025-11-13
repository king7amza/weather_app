import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/features/home/models/current_weather_response_model.dart';
import 'package:weather_app/features/home/views/widgets/todays_highlights_widget.dart';

class CarouselHighlightsWidget extends StatelessWidget {
  final CurrentWeatherResponseModel currentWeather;
  const CarouselHighlightsWidget({super.key, required this.currentWeather});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return CarouselSlider(
      options: CarouselOptions(
        height: size.height * 0.26,
        autoPlay: true,
        viewportFraction: 1,
      ),
      items: CarouselHighlightsCases.generateHighlights(currentWeather).map((
        highlightCard,
      ) {
        return Builder(
          builder: (BuildContext context) {
            return highlightCard;
          },
        );
      }).toList(),
    );
  }
}
