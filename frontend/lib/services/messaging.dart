// import 'package:therapease/services/local_notification.dart';
// import 'package:therapease/utils/utils.dart';

// class RecodamFirebaseService {
//   static void initNotification(BuildContext context) async {
//     LocalNotificationService.initilize(context);
//     await FirebaseMessaging.instance.requestPermission();
//     // Terminated State
//     FirebaseMessaging.instance.getInitialMessage().then((event) {
//       if (event != null) {
//         debugPrint('GABBYGREAT TERMINATED');
//         var payload = NotificationPayload.fromJson(event.data);
//         if (payload.type == NotificationType.recordConfirmation) {
//           context.push(UnConfirmedRecordsScreen.name);
//         }
//       }
//     });
//     // Foreground State
//     FirebaseMessaging.onMessage.listen((event) {
//       LocalNotificationService.showNotificationOnForeground(event);
//       debugPrint('GABBYGREAT FORE');
//     });
//     // Background State
//     FirebaseMessaging.onMessageOpenedApp.listen((event) {
//       LocalNotificationService.showNotificationOnForeground(event);
//       debugPrint('GABBYGREAT BACK');
//     });
//   }
// }
