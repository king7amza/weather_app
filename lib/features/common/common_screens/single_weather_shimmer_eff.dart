import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:weather_app/core/utils/themes/app_colors.dart';

class SingleWeatherShimmerEff extends StatelessWidget {
  const SingleWeatherShimmerEff({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Shimmer.fromColors(
        baseColor: AppColors.primaryColor,
        highlightColor: AppColors.secondaryColor,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: AppColors.secondaryColor,
            gradient: LinearGradient(
              colors: [AppColors.secondaryColor, AppColors.primaryColor],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
          height: 140,
          width: double.infinity,
          child: Center(
            child: Image.asset(
              'assets/images/wow_such_empty.png',
              width: 100,
              height: 100,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
