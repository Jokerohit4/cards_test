import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        getPages: AppPages.pages,
        //   initialBinding: AuthBinding(),
        title: StringConstants.cards,
        home: HomeView(),
      );
}
