class ImageAssets {
  ImageAssets._();
  static String noInternet(bool isDark) {
    return isDark
        ? 'assets/images/no_internet_dark.svg'
        : 'assets/images/no_internet.svg';
  }

  static const String update = 'assets/images/update.svg';
  static const String onBoarding1 =
      'assets/images/on_boarding_images/sammy-line-searching.gif';
  static const String onBoarding2 =
      'assets/images/on_boarding_images/sammy-line-shopping.gif';
  static const String onBoarding3 =
      'assets/images/on_boarding_images/sammy-line-delivery.gif';
}
