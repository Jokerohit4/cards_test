import 'package:get/get.dart';

import 'app_pages.dart';

/// A chunk of routes taken in the application.
abstract class RouteManagement {
  /// Go to the home screen.

  static void goToHome() {
    Get.toNamed<void>(
      Routes.homeScreen,
    );
  }
}
