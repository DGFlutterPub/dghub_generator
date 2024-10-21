import 'dart:typed_data';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  final _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  Future<void> init() async {
    const androidInitializationSetting =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const iosInitializationSetting = DarwinInitializationSettings();
    const initSettings = InitializationSettings(
        android: androidInitializationSetting, iOS: iosInitializationSetting);
    await _flutterLocalNotificationsPlugin.initialize(initSettings,
        onDidReceiveNotificationResponse: onDidReceiveNotificationResponse,
        onDidReceiveBackgroundNotificationResponse:
            onDidReceiveBackgroundNotificationResponse);
  }

  onDidReceiveNotificationResponse(NotificationResponse n) {
    switch (n.actionId) {
      case 'orderCancel':
      default:
    }
  }

  @pragma('vm:entry-point')
  static void onDidReceiveBackgroundNotificationResponse(
      NotificationResponse n) {}

  void show(String title, String body) {
    const androidNotificationDetail = AndroidNotificationDetails(
        enableVibration: true,
        playSound: true,
        // sound: UriAndroidNotificationSound("assets/sounds/call.mp3"),
        importance: Importance.high,
        priority: Priority.high,
        '0', // channel Id
        'general' // channel Name
        );
    const iosNotificatonDetail = DarwinNotificationDetails();
    const notificationDetails = NotificationDetails(
      iOS: iosNotificatonDetail,
      android: androidNotificationDetail,
    );
    _flutterLocalNotificationsPlugin.show(0, title, body, notificationDetails);
  }

  void showWithButton(
      {required String title,
      required String body,
      required String data,
      required int id}) {
    var androidNotificationDetail = AndroidNotificationDetails(
        actions: [
          const AndroidNotificationAction('orderCancel', 'Cancel',
              showsUserInterface: true),
          const AndroidNotificationAction('orderAccept', 'Accept',
              showsUserInterface: true),
        ],
        autoCancel: false,
        audioAttributesUsage: AudioAttributesUsage.alarm,
        vibrationPattern: Int64List.fromList([0, 1000, 5000, 2000]),
        enableVibration: true,
        playSound: true,
        sound:
            const UriAndroidNotificationSound("assets/sounds/notification.mp3"),
        importance: Importance.high,
        priority: Priority.high,
        '0', // channel Id
        'general' // channel Name
        );
    const iosNotificatonDetail = DarwinNotificationDetails();
    var notificationDetails = NotificationDetails(
      iOS: iosNotificatonDetail,
      android: androidNotificationDetail,
    );
    _flutterLocalNotificationsPlugin.show(id, title, body, notificationDetails,
        payload: data);
  }
}
