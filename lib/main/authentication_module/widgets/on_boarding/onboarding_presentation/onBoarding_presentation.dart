import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tejara_store/core/assets/custom_colors.dart';
import 'package:tejara_store/core/assets/image_assets.dart';
import 'package:tejara_store/core/assets/sizes.dart';
import 'package:tejara_store/main/authentication_module/widgets/on_boarding/onboarding_presentation/onBoarding_page.dart';
import 'package:tejara_store/main/authentication_module/widgets/on_boarding/onboarding_presentation/titleonboarding.dart';

class OnboardingPresentation extends HookWidget {
  final VoidCallback goToLogin;
  const OnboardingPresentation({super.key, required this.goToLogin});

  @override
  Widget build(BuildContext context) {
    final controller = usePageController();
    final currentPage = useState(0);

    useEffect(() {
      void listener() {
        currentPage.value = controller.page?.round() ?? 0;
      }

      controller.addListener(listener);
      return () => controller.removeListener(listener);
    }, [controller]);

    return Scaffold(
      body: Stack(
        children: [
          /// Pages
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

          /// Skip Button
          Positioned(
            top: kToolbarHeight,
            right: TejaraSizes.defaultSpace,
            child: TextButton(onPressed: goToLogin, child: const Text("Skip")),
          ),

          /// Bottom Controls
          Positioned(
            bottom: TejaraSizes.defaultSpace,
            left: TejaraSizes.defaultSpace,
            right: TejaraSizes.defaultSpace,
            child: Column(
              children: [
                SmoothPageIndicator(
                  controller: controller,
                  count: 3,
                  effect: const ExpandingDotsEffect(
                    activeDotColor: TejaraColors.buttonPrimary,
                    dotHeight: 8,
                  ),
                ),
                const SizedBox(height: TejaraSizes.spaceBtwSections),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (currentPage.value == 2) {
                        goToLogin();
                      } else {
                        controller.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: TejaraColors.buttonPrimary,
                      foregroundColor: TejaraColors.textWhite,
                    ),
                    child: Text(
                      currentPage.value == 2 ? "Get Started" : "Next",
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
