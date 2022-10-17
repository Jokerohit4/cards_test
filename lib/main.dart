import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app.dart';

void main() async {
  runApp(const MyApp());
}

//notes in readME
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        getPages: AppPages.pages,
        title: StringConstants.cards,
        home: const HomeView(),
        theme: ThemeData(fontFamily: 'Circular Std'),
      );
}
