import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:weather_app/core/utils/themes/app_colors.dart';

class ShimmerEff extends StatelessWidget {
  const ShimmerEff({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Shimmer.fromColors(
      baseColor: AppColors.primaryColor,
      highlightColor: AppColors.secondaryColor,
      child: Image.asset(
        'assets/images/shimmer_eff_img.png',
        width: 400,
        height: 400,
        fit: BoxFit.contain,
      ),
    );
  }
}
