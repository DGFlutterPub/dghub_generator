import 'package:encrypt_shared_preferences/provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_strategy/url_strategy.dart';
import '../../config/global.dart';
import '../widgets/splash/native_splash.dart';

class DGHubServices {
  static init({required Future<void> Function() onSplashing}) async {
    var wb = WidgetsFlutterBinding.ensureInitialized();

    NativeSplash.start(widgetsBinding: wb);

    await EncryptedSharedPreferences.initialize(secertKey.substring(0, 15));

    // await NotificationService().init();

    if (kIsWeb) {
      setPathUrlStrategy();
    } else {
      // await BackgroundService.init();
    }
    await onSplashing();
    NativeSplash.close();
  }
}
