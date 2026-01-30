import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:karma_design_system_mobile/karma_design_system_mobile.dart';
import 'package:tejara_store/core/assets/image_assets.dart';

class AppStoreUpdatePresentation extends StatelessWidget {
  final String? installedVersion;
  final String? appStoreVersion;
  final VoidCallback updateApplication;

  const AppStoreUpdatePresentation({
    super.key,
    required this.installedVersion,
    required this.appStoreVersion,
    required this.updateApplication,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          GetIt.instance<StyleConfig>().colorStyleConfig.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(ImageAssets.update, height: 250),
              const SizedBox(height: 30),
              Text(
                "Mettre à jour l'application",
                style: TextStylingUtil.f18w800(),
              ),
              const SizedBox(height: 18),
              Text(
                "Une version récente de l'application est désormais disponible !",
                style: TextStylingUtil.f14w400(),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 5),
              Text(
                'Vous utilisez actuellement la version v$installedVersion.',
                style: TextStylingUtil.f14w400(),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 5),
              Text(
                'Veuillez procéder à la mise à jour vers la nouvelle version v$appStoreVersion. Merci !',
                style: TextStylingUtil.f14w400(),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 18),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: SgPlainButton(
                  text: 'Mettre à jour maintenant',
                  onPressed: updateApplication,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
