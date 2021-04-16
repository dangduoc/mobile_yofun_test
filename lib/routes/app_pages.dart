part of 'app_routes.dart';

class AppPages {
  static const INITIAL = '/';
  static final routers = [
    GetPage(
      name: '/',
      page: () => AppRootWidget(),
      children: [
        GetPage(
          name: Routes.SETTINGS,
          page: () => SettingPage(),
          binding: SettingBinding(),
        ),
        GetPage(
          name: Routes.HOME,
          page: () => HomePage(),
        ),
        GetPage(
          name: Routes.HOME,
          page: () => HomePage(),
        ),
      ],
    ),
  ];
}
