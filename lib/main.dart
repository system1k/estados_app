import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:estados/pages/pages_1.dart';
import 'package:estados/pages/pages_2.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: '/page1',
      getPages: [
        GetPage(name: '/page1', page: () => const Page1Screen()),
        GetPage(name: '/page2', page: () => const Page2Screen())
      ],
    );
  }
}