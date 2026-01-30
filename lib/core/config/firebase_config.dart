import 'package:tejara_store/debug/firebase_options.dart' as firebase_release;
import 'package:tejara_store/debug/firebase_options.dart' as firebase_debug;
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

class FirebaseConfig {
  static FirebaseOptions get options => kDebugMode
      ? firebase_debug.DefaultFirebaseOptions.currentPlatform
      : firebase_release.DefaultFirebaseOptions.currentPlatform;
  static final AndroidAppCheckProvider providerAndroid = kDebugMode
      ? AndroidDebugProvider()
      : AndroidPlayIntegrityProvider();
  static final AppleAppCheckProvider providerApple = kDebugMode
      ? AppleDebugProvider()
      : AppleDeviceCheckProvider();
}
