// import 'dart:convert';

// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:therapease/utils/utils.dart';

// class LocalNotificationService {
//   static final FlutterLocalNotificationsPlugin _notificationsPlugin =
//       FlutterLocalNotificationsPlugin();

//   static void initilize(BuildContext context) {
//     const InitializationSettings initializationSettings =
//         InitializationSettings(
//       android: AndroidInitializationSettings("ic_notification"),
//       iOS: DarwinInitializationSettings(),
//     );
//     _notificationsPlugin.initialize(
//       initializationSettings,
//       onDidReceiveNotificationResponse: (NotificationResponse details) {
//         if (details.payload != null) {
//           var notification =
//               NotificationPayload.fromJson(jsonDecode(details.payload!));
//           if (notification.type == NotificationType.recordConfirmation) {
//             context.pushNamed(UnConfirmedRecordsScreen.name);
//           }
//         }
//       },
//     );
//   }

//   static void showNotificationOnForeground(RemoteMessage message) async {
//     var notificationDetail = const NotificationDetails(
//       android: AndroidNotificationDetails(
//         "org.recodam.mobile",
//         "firebase_push_notification",
//         importance: Importance.max,
//         priority: Priority.high,
//         playSound: true,
//         visibility: NotificationVisibility.public,
//         color: Colors.red,
//         icon: '@drawable/ic_notification',
//       ),
//     );

//     await _notificationsPlugin.show(
//       DateTime.now().microsecond,
//       message.notification?.title,
//       message.notification?.body,
//       notificationDetail,
//       payload: jsonEncode(message.data),
//     );
//   }
// }
