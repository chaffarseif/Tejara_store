import 'package:get_it/get_it.dart';
import 'package:karma_design_system_mobile/configs/style.config.dart';

class ImageAssets {
  ImageAssets._();
  static String noInternet() {
    return GetIt.instance<StyleConfig>().isDarkMode
        ? 'assets/images/no_internet_dark.svg'
        : 'assets/images/no_internet.svg';
  }

  static const String update = 'assets/images/update.svg';
}
