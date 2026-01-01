import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerEffectWidget extends StatelessWidget {
  const ShimmerEffectWidget({super.key});

  @override
  Widget build(BuildContext context) {
  final size = MediaQuery.sizeOf(context);
    return Shimmer.fromColors(
      baseColor: Theme.of(context).colorScheme.primary,
      highlightColor: Theme.of(context).colorScheme.secondary,
      child: Image.asset(
        'assets/images/logo.png',
        width: size.width * 0.7,
        height: size.height * 0.7,
        fit: BoxFit.contain,
      ),
    );
  }
}
