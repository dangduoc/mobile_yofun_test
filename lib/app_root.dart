import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_test/pages/home/home_page.dart';
import 'package:flutter_application_test/pages/setting/setting_page.dart';
import 'package:get/get.dart';

import 'pages/notification/notification_page.dart';

class AppRootWidget extends StatelessWidget {
  final controller = Get.put(AppRootController(), permanent: true);
  final List<_BottomNavigationItem> _bottomNavigationItems = [
    _BottomNavigationItem(
      id: 1,
      icon: Icon(Icons.home_outlined),
      activeIcon: Icon(
        Icons.home,
        color: Colors.yellow,
      ),
      label: 'Trang chủ',
      widgetBuilder: (context) => HomePage(),
    ),
    _BottomNavigationItem(
      id: 2,
      icon: Icon(Icons.notifications_none_outlined),
      activeIcon: Icon(Icons.notifications),
      label: 'Thông báo',
      widgetBuilder: (context) => NotificationPage(),
    ),
    _BottomNavigationItem(
      id: 3,
      icon: Icon(Icons.settings),
      activeIcon: Icon(Icons.settings),
      label: 'Cài đặt',
      widgetBuilder: (context) => SettingPage(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Obx(
          () => IndexedStack(
            index: controller.currentTab,
            children: _bottomNavigationItems
                .map(
                  (item) => item.widgetBuilder(context),
                )
                .toList(),
          ),
        ),
        bottomNavigationBar: Obx(
          () => _AppBottomNavigationBar(
            items: _bottomNavigationItems,
            currentTab: controller.currentTab,
            onSelectedTab: controller.onSelectTab,
          ),
        ),
      ),
    );
  }
}

class _AppBottomNavigationBar extends StatelessWidget {
  _AppBottomNavigationBar({
    required this.onSelectedTab,
    required this.items,
    required this.currentTab,
  });
  final ValueChanged<int> onSelectedTab;
  final List<_BottomNavigationItem> items;
  final int currentTab;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      elevation: 1,
      type: BottomNavigationBarType.fixed,
      items: items
          .map(
            (item) => BottomNavigationBarItem(
              icon: item.icon,
              activeIcon: item.activeIcon,
              label: item.label,
            ),
          )
          .toList(),
      onTap: onSelectedTab,
      selectedFontSize: 12.0,
      selectedItemColor: Colors.yellow,
      currentIndex: currentTab,
    );
  }
}

class _BottomNavigationItem {
  const _BottomNavigationItem({
    required this.id,
    required this.label,
    required this.icon,
    required this.activeIcon,
    required this.widgetBuilder,
  });
  final int id;
  final String label;
  final Widget icon;
  final Widget activeIcon;
  final WidgetBuilder widgetBuilder;
}

class AppRootController extends GetxController {
  final Rx<int> _currentTab = Rx<int>(1);
  int get currentTab => this._currentTab.value;
  Rx<int> _currentUserId = Rx<int>(1);
  int get currentUserId => _currentUserId.value;
  void onSelectTab(int index) {
    this._currentTab.value = index;
  }

  @override
  void onInit() {
    super.onInit();
  }

  void setUserId(int userId) => this._currentUserId.value = userId;
}
