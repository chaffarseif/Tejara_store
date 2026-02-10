import 'package:flutter/material.dart';
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
      padding: const EdgeInsets.all(TejaraSizes.defaultSpace),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: TejaraSizes.defaultSpace * 4),

          /// Animation
          Image.asset(
            lottie,
            fit: BoxFit.contain,
            height: MediaQuery.of(context).size.height * 0.4,
          ),

          const SizedBox(height: TejaraSizes.spaceBtwSections),

          /// Title
          Text(
            title,
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: TejaraSizes.spaceBtwItems),

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
