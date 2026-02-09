import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SplashPresentation extends HookWidget {
  const SplashPresentation({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? Colors.black : Colors.white,
      body: Center(
        child: Image.asset(
          isDark
              ? 'assets/logos/t-store-splash-logo-white.png'
              : 'assets/logos/t-store-splash-logo-black.png',
          width: 300,
          height: 300,
        ),
      ),
    );
  }
}
