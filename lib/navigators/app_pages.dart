import 'package:get/get.dart';

import '../app.dart';

part 'app_routes.dart';

/// Contains the list of app.app.app.app.navigators.navigators.pages or routes taken across the whole application.
/// This will prevent us in using context for navigation. And also providing
/// the blocs required in the next named routes.
///
/// [app.app.app.app.navigators.navigators.pages] : will contain all the app.app.app.app.navigators.navigators.pages in the application as a route
/// and will be used in the material app.

class AppPages {
  static var transitionDuration = const Duration(
    milliseconds: 550,
  );

  static final pages = [
    GetPage<HomeView>(
      name: Routes.homeScreen,
      transitionDuration: transitionDuration,
      page: () => const HomeView(),
      transition: Transition.fadeIn,
    ),
  ];
}
