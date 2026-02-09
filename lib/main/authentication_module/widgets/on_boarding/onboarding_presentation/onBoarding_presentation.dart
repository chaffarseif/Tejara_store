import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tejara_store/core/assets/custom_colors.dart';
import 'package:tejara_store/core/assets/image_assets.dart';
import 'package:tejara_store/core/assets/sizes.dart';
import 'package:tejara_store/main/authentication_module/widgets/on_boarding/onboarding_presentation/onBoarding_page.dart';
import 'package:tejara_store/main/authentication_module/widgets/on_boarding/onboarding_presentation/titleonboarding.dart';

class OnboardingPresentation extends HookWidget {
  const OnboardingPresentation({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = usePageController();

    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller,
            children: [
              OnboardingPage(
                lottie: ImageAssets.onBoarding1,
                title: Textonboarding.onBoarding1Title,
                description: Textonboarding.onBoarding1Description,
              ),
              OnboardingPage(
                lottie: ImageAssets.onBoarding2,
                title: Textonboarding.onBoarding2Title,
                description: Textonboarding.onBoarding2Description,
              ),
              OnboardingPage(
                lottie: ImageAssets.onBoarding3,
                title: Textonboarding.onBoarding3Title,
                description: Textonboarding.onBoarding3Description,
              ),
            ],
          ),
          Positioned(
            bottom: TejaraSizes.appBarHeight,
            left: 0,
            right: 0,
            child: Center(
              child: SmoothPageIndicator(
                controller: controller,
                count: 3,
                effect: const ExpandingDotsEffect(
                  activeDotColor: TejaraColors
                      .buttonPrimary, // Vous pouvez changer la couleur ici
                  dotHeight: 8,
                  dotWidth: 8,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: TejaraSizes.appBarHeight,
            left: 0,
            right: 0,
            child: ElevatedButton(onPressed: () {}, child: Text("Next")),
          ),
        ],
      ),
    );
  }
}
