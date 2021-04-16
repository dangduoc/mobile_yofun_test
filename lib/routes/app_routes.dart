import 'package:flutter_application_test/app_root.dart';
import 'package:flutter_application_test/pages/home/home_page.dart';
import 'package:flutter_application_test/pages/setting/setting_binding.dart';
import 'package:flutter_application_test/pages/setting/setting_page.dart';
import 'package:get/get.dart';

part 'app_pages.dart';

abstract class Routes {
  static const SETTINGS = '/settings';
  static const NOTIFICATIONS = '/notifications';
  static const HOME = '/home';
}
