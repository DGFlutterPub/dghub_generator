import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../config/global.dart';
/*import*/

class BackgroundService {
  @pragma('vm:entry-point')
  static Future<void> onStart(ServiceInstance service) async {
    DartPluginRegistrant.ensureInitialized();
    /*onBackground*/
  }

  static init() async {
    if (!kIsWeb) {
      await _init();
    }
  }

  //-- Init
  static _init() async {
    const notificationChannelId = 'foreground';

// this will be used for notification id, So you can update your custom notification with this id.
    const notificationId = 888;

    final service = FlutterBackgroundService();
    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      notificationChannelId, // id
      appName, // title
      description: appPackageName, // description
      importance: Importance.low, // importance must be at low or higher level
    );

    final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    await service.configure(
        androidConfiguration: AndroidConfiguration(
          // this will be executed when app is in foreground or background in separated isolate
          onStart: onStart,

          // auto start service
          autoStart: true,
          isForegroundMode: false,

          notificationChannelId:
              notificationChannelId, // this must match with notification channel you created above.
          initialNotificationTitle: appName,
          initialNotificationContent: appPackageName,
          foregroundServiceNotificationId: notificationId,
        ),
        iosConfiguration: IosConfiguration());
    if (!await service.isRunning()) {
      service.startService();
    }
  }
}
