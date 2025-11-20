import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class SingleWeatherShimmerEff extends StatelessWidget {
  const SingleWeatherShimmerEff({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Shimmer.fromColors(
        baseColor: Theme.of(context).colorScheme.primary,
        highlightColor: Theme.of(context).colorScheme.secondary,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
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
          height: 140,
          width: double.infinity,
        ),
      ),
    );
  }
}
