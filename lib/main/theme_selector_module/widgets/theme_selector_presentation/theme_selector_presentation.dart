import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:karma_design_system_mobile/configs/style_config_mode.dart';
import 'package:tejara_store/core/assets/custom_colors.dart';
import 'package:tejara_store/main/theme_selector_module/widgets/theme_selector_presentation/theme_selector_keys.dart';

class ThemeSelectorPresentation extends HookWidget {
  final StyleConfigModeType defaultMode;
  final ValueSetter<StyleConfigModeType> onSelectMode;

  const ThemeSelectorPresentation({
    super.key,
    required this.defaultMode,
    required this.onSelectMode,
  });

  @override
  Widget build(BuildContext context) {
    final currentMode = useState<StyleConfigModeType>(defaultMode);

    bool isDarkMode() => currentMode.value == StyleConfigModeType.dark;

    void selectMode(StyleConfigModeType mode) {
      currentMode.value = mode;
    }

    return Scaffold(
      backgroundColor: isDarkMode() ? TejaraColors.primary : TejaraColors.white,
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: isDarkMode() ? TejaraColors.primary : TejaraColors.white,
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isDarkMode()
                      ? TejaraColors.primary
                      : TejaraColors.accent,
                ),
                child: Icon(
                  isDarkMode() ? Icons.nightlight_round_sharp : Icons.wb_sunny,
                  size: 50,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 50),
              Text(
                'Choisir un style',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: isDarkMode() ? Colors.white : Colors.black,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Sélectionnez le mode clair ou sombre pour personnaliser l’apparence de votre application.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: isDarkMode() ? Colors.white70 : Colors.black,
                ),
              ),
              const SizedBox(height: 40),
              Container(
                width: 300,
                height: 55,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(30.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 2,
                      spreadRadius: 1,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Stack(
                  children: [
                    AnimatedPositioned(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      left: isDarkMode() ? 150 : 0,
                      child: Container(
                        width: 150,
                        height: 55,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            key: ThemeSelectorKeys.lightModeButtonKey,
                            behavior: HitTestBehavior.opaque,
                            onTap: () => selectMode(StyleConfigModeType.light),
                            child: Center(
                              child: Text(
                                'Light',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: !isDarkMode()
                                      ? Colors.black
                                      : Colors.black54,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            key: ThemeSelectorKeys.darkModeButtonKey,
                            behavior: HitTestBehavior.opaque,
                            onTap: () => selectMode(StyleConfigModeType.dark),
                            child: Center(
                              child: Text(
                                'Dark',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: isDarkMode()
                                      ? Colors.black
                                      : Colors.black54,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 100),
              Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: IconButton(
                  onPressed: () => onSelectMode(currentMode.value),
                  icon: Icon(
                    Icons.arrow_forward_sharp,
                    color: isDarkMode()
                        ? TejaraColors.primary
                        : TejaraColors.accent,
                    size: 40,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
