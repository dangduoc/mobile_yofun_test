import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_test/core/services/firebase_messaging.dart';
import 'package:flutter_application_test/routes/app_routes.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'core/services/flutter_local_notification.dart';
import 'services/settings/user_device_token_service.dart';

Future<void> configure() async {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  await messaging.getInitialMessage();
  FirebaseMessaging.onMessage.listen(
    (RemoteMessage message) async {
      print('Got a message whilst in the foreground!');
      // print('Message data: ${message.data}');

      // if (message.notification != null) {
      //   print('Message also contained a notification: ${message.notification}');
      // }

      RemoteNotification? notification = message.notification;
      //   AndroidNotification? android = message.notification?.android;

      if (notification != null) {
        await getIt<FlutterLocalNotificationService>().showNotif(notification);
        if (message.data.keys.length > 0) {
          if (Get.key.currentContext != null)
            ScaffoldMessenger.of(Get.key.currentContext!).showSnackBar(
              SnackBar(
                padding: const EdgeInsets.all(8),
                duration: Duration(minutes: 3),
                content: Text(
                  message.data.toString(),
                  style: TextStyle(fontSize: 16),
                ),
                action: SnackBarAction(
                  label: "Đóng",
                  onPressed: () => ScaffoldMessenger.of(Get.key.currentContext!)
                      .hideCurrentSnackBar(),
                ),
              ),
            );
        }
      }
    },
    onError: (e) => print(e),
    onDone: () => print('On Done'),
  );
}

GetIt getIt = GetIt.instance;
Future<FirebaseApp> configDependencies() async {
  final _initialization = await Firebase.initializeApp();
  getIt.registerSingleton(FlutterLocalNotificationService());
  getIt.registerLazySingleton<http.Client>(() => http.Client());
  getIt.registerLazySingleton<IUserDeviceTokenService>(
      () => UserDeviceTokenService(getIt<http.Client>()));
  await configure();
  return _initialization;
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App());
}

class App extends StatelessWidget {
  // Create the initialization Future outside of `build`:
  final Future<FirebaseApp> _initialization = configDependencies();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          print(snapshot.error);
          return Text('Lỗi khởi tạo', textDirection: TextDirection.ltr);
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MyApp();
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return CircularProgressIndicator();
      },
    );
  }
}

class MyApp extends StatelessWidget {
  //final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //   statusBarColor: Colors.transparent,
    //   systemNavigationBarColor: Colors.white,
    //   systemNavigationBarIconBrightness: Brightness.dark,
    //   statusBarBrightness: Brightness.dark,
    //   systemNavigationBarDividerColor: Colors.white,
    //   statusBarIconBrightness: Brightness.light,
    // ));

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      enableLog: true,
      getPages: AppPages.routers,
      initialRoute: AppPages.INITIAL,
      themeMode: ThemeMode.light,
    );
  }
}
