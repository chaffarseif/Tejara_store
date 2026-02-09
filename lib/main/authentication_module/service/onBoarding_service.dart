import 'package:shared_preferences/shared_preferences.dart';

class OnBoardingService {
  late SharedPreferences _sharedPreferences;
  OnBoardingService._singleton();
  static final instance = OnBoardingService._singleton();

  factory OnBoardingService({required SharedPreferences sharedPreferences}) {
    instance._sharedPreferences = sharedPreferences;
    return instance;
  }

  static String onBoardingSeenKey = 'onBoardingSeen';

  Future<bool> onBoardingSeen() async {
    try {
      return await _sharedPreferences.getBool(onBoardingSeenKey);
    } on Exception catch (e) {
      return false;
    }
  }

  Future<void> setOnBoardingSeen() async {
    await _sharedPreferences.setValue(onBoardingSeenKey, true);
  }
}
