import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CommonShimmerEff extends StatelessWidget {
  const CommonShimmerEff({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Shimmer.fromColors(
      baseColor: Theme.of(context).colorScheme.primary,
      highlightColor: Theme.of(context).colorScheme.secondary,
      child: Image.asset(
        'assets/images/logo.png',
        width: 400,
        height: 400,
        fit: BoxFit.contain,
      ),
    );
  }
}
