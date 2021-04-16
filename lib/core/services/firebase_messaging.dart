import 'package:firebase_messaging/firebase_messaging.dart';
import 'flutter_local_notification.dart';

class FirebaseMessagingService {
  final FlutterLocalNotificationService flutterLocalNotificationsPlugin;
  FirebaseMessagingService(this.flutterLocalNotificationsPlugin);
  FirebaseMessaging fcm = FirebaseMessaging.instance;
  // Future<void> _firebaseMessagingBackgroundHandler(
  //     RemoteMessage message) async {
  //   // If you're going to use other Firebase services in the background, such as Firestore,
  //   // make sure you call `initializeApp` before using other Firebase services.
  //   //await Firebase.initializeApp();
  //   //if(message==null)
  //   print("Handling a background message: ${message.messageId}");
  // }

}
