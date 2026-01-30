import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:karma_design_system_mobile/karma_design_system_mobile.dart';
import 'package:tejara_store/core/assets/image_assets.dart';

class NoInternetConnectionPresentation extends StatelessWidget {
  const NoInternetConnectionPresentation({super.key});

  @override
  Widget build(BuildContext context) {
    final styleConfig = GetIt.instance<StyleConfig>();

    return Scaffold(
      body: Container(
        color: styleConfig.colorStyleConfig.backgroundColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(ImageAssets.noInternet(), height: 200),
                  const SizedBox(height: 50),
                  Text(
                    'Pas de connexion Internet',
                    style: TextStylingUtil.f24w900(),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: CircularProgressIndicator(
                  color: styleConfig.colorStyleConfig.primaryColor,
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
