// ignore_for_file: prefer_const_constructors

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/standalone.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest_all.dart' as tzl;

class NotificationsHelper {
  static final _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

//needs an icon
  static final _initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');

  static final _initializationSettings =
      InitializationSettings(android: _initializationSettingsAndroid);

  static Future<void> init() async {
    await _flutterLocalNotificationsPlugin.initialize(_initializationSettings);
    tz.initializeDatabase([]);
    tzl.initializeTimeZones();
  }

  static final _androidNotificationDetails = AndroidNotificationDetails(
    'channel id',
    'channel name',
    channelDescription: 'channel description',
    importance: Importance.max,
    priority: Priority.high,
  );

  static final _notificationDetails =
      NotificationDetails(android: _androidNotificationDetails);

  final AndroidFlutterLocalNotificationsPlugin? androidImplementation =
      _flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>();

// set Notification methoud
  static Future<void> setNotification(DateTime dateTime, String title, String desc, int id) async {

    await _flutterLocalNotificationsPlugin.zonedSchedule(
      id,
      'scheduled title',
      'scheduled body',
      // tz.TZDateTime.now(tz.local).add(Duration(seconds: 5)),
      tz.TZDateTime(
          tz.getLocation('Asia/Calcutta'),
          dateTime.year,
          dateTime.month,
          dateTime.day,
          dateTime.hour,
          dateTime.minute,
          dateTime.second),
      _notificationDetails,
      // androidScheduleMode:
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
    );
    print(dateTime);
    print(
        "Notification set for ${tz.TZDateTime(tz.getLocation('Asia/Calcutta'), dateTime.year, dateTime.month, dateTime.day, dateTime.hour, dateTime.minute, dateTime.second)}.");
    print(tz.local);
  }

// cancel Notification methoud
  static Future<void> cancelNotification(int id) async {
    await _flutterLocalNotificationsPlugin.cancel(id);
  }
}
