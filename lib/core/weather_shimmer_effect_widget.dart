import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class WeatherShimmerEffectWidget extends StatelessWidget {
  const WeatherShimmerEffectWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: size.height * 0.02),
      child: Shimmer.fromColors(
        baseColor: Theme.of(context).colorScheme.primary,
        highlightColor: Theme.of(context).colorScheme.secondary,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(size.width * 0.05),
            color: Theme.of(context).colorScheme.secondary,
            gradient: LinearGradient(
              colors: [
                Theme.of(context).colorScheme.secondary,
                Theme.of(context).colorScheme.primary,
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
          height: size.height * 0.15,
          width: double.infinity,
        ),
      ),
    );
  }
}
