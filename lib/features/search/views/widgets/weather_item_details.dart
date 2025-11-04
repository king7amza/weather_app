import 'package:flutter/material.dart';
import 'package:weather_app/core/utils/themes/app_colors.dart';
import 'package:weather_app/features/search/models/search_api_response.dart';

class WeatherItemDetails extends StatelessWidget {
  final Weather cityWeather;
  const WeatherItemDetails({super.key, required this.cityWeather});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: AppColors.secondaryColor,
      ),
      height: 200,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text("Local Names:", style: TextStyle(fontWeight: FontWeight.bold)),
          ...?cityWeather.localNames?.entries.map(
            (entry) => Text("${entry.key} : ${entry.value}"),
          ),
        ],
      ),
    );
  }
}
