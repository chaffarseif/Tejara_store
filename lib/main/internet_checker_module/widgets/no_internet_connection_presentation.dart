import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:karma_design_system_mobile/karma_design_system_mobile.dart';
import 'package:tejara_store/core/assets/image_assets.dart';
import 'package:tejara_store/core/config/global_config.dart';

class NoInternetConnectionPresentation extends StatelessWidget {
  const NoInternetConnectionPresentation({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: Container(
        color: isDark
            ? TejaraTheme.darkTheme.primaryColor
            : TejaraTheme.lightTheme.primaryColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(ImageAssets.noInternet(isDark), height: 200),
                  const SizedBox(height: 50),
                  Text(
                    'Pas de connexion Internet',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: CircularProgressIndicator(
                  color: isDark
                      ? TejaraTheme.darkTheme.scaffoldBackgroundColor
                      : TejaraTheme.lightTheme.scaffoldBackgroundColor,
                  strokeWidth: 4,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
