import 'package:tejara_store/core/assets/custom_colors.dart';
import 'package:karma_design_system_mobile/avatar/configs/sg_avatar_style.config.dart';
import 'package:karma_design_system_mobile/buttons/configs/sg_link_button_style.config.dart';
import 'package:karma_design_system_mobile/buttons/configs/sg_plain_button_style.config.dart';
import 'package:karma_design_system_mobile/configs/color_style.config.dart';
import 'package:karma_design_system_mobile/configs/style.config.dart';
import 'package:karma_design_system_mobile/configs/style_config_mode.dart';

class GlobalConfig {
  static const pageSize = 12;
  static const shortPageSize = 6;

  static StyleConfig styleConfig(StyleConfigModeType selectedMode) {
    final ColorStyleConfigItem lightMode = ColorStyleConfigItem(
      primaryColor: TejaraColors.primary,
      backgroundColor: TejaraColors.white,
      surfaceColor: TejaraColors.white,
      textColor: TejaraColors.primary,
    );
    return StyleConfig(
      selectedMode: selectedMode,
      colorStyleConfig: ColorStyleConfig(
        initialMode: lightMode,
        lightMode: lightMode,
        darkMode: ColorStyleConfigItem(
          primaryColor: TejaraColors.primary,
          backgroundColor: TejaraColors.dark,
          surfaceColor: TejaraColors.darkContainer,
          textColor: TejaraColors.white,
        ),
      ),
      fontFamily: 'Roboto',
      sgAvatarStyleConfig: SgAvatarStyleConfig(
        initialMode: SgAvatarStyleConfigItem(
          backgroundColor: TejaraColors.primary,
          size: 90,
        ),
      ),
      sgPlainButtonStyleConfig: SgPlainButtonStyleConfig(
        initialMode: SgPlainButtonStyleConfigItem(
          backgroundColor: TejaraColors.primary,
        ),
      ),
      sgLinkButtonStyleConfig: SgLinkButtonStyleConfig(
        initialMode: SgLinkButtonStyleConfigItem(
          textColor: TejaraColors.primary,
        ),
        darkMode: SgLinkButtonStyleConfigItem(textColor: TejaraColors.primary),
      ),
    );
  }
}
