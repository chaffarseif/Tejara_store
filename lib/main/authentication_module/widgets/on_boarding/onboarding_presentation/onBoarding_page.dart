import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tejara_store/core/assets/sizes.dart';

class OnboardingPage extends StatelessWidget {
  final String lottie;
  final String title;
  final String? description;

  const OnboardingPage({
    required this.lottie,
    required this.title,
    this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: TejaraSizes.defaultSpace,
        vertical: TejaraSizes.defaultSpace,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          /// Animation
          Image.asset(lottie, fit: BoxFit.contain),

          const SizedBox(height: 24),

          /// Title
          Text(
            title,
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 12),

          /// Description
          if (description != null)
            Text(
              description!,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
        ],
      ),
    );
  }
}
