import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/core/utils/themes/app_colors.dart';
import 'package:weather_app/features/home/models/current_weather_response_model.dart';
import 'package:weather_app/features/home/views/widgets/todays_highlights_widget.dart';

class CarouselHighlightsWidget extends StatefulWidget {
  final CurrentWeatherResponseModel currentWeather;
  const CarouselHighlightsWidget({super.key, required this.currentWeather});

  @override
  State<CarouselHighlightsWidget> createState() =>
      _CarouselHighlightsWidgetState();
}

class _CarouselHighlightsWidgetState extends State<CarouselHighlightsWidget> {
  final CarouselSliderController controller = CarouselSliderController();
  int current = 0;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final List<Widget> highlights = CarouselHighlightsCases.generateHighlights(
      widget.currentWeather,
    );
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CarouselSlider(
          carouselController: controller,
          options: CarouselOptions(
            height: size.height * 0.26,
            autoPlay: true,
            viewportFraction: 1,
            onPageChanged: (index, reason) {
              setState(() {
                current = index;
              });
            },
          ),
          items: highlights.map((highlightCard) {
            return Builder(
              builder: (BuildContext context) {
                return highlightCard;
              },
            );
          }).toList(),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: highlights.asMap().entries.map((entry) {
              final index = entry.key;
              return Container(
                width: 10,
                height: 10,
                margin: const EdgeInsets.symmetric(horizontal: 4.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: current == index
                      ? Theme.of(context).colorScheme.primary
                      : AppColors.lightWhite,
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
