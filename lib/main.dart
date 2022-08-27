import 'package:flutter/material.dart';

import 'package:estados/pages/pages_1.dart';
import 'package:estados/pages/pages_2.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'page1',
      routes: {
        'page1' : (_) => const Page1Screen(),
        'page2' : (_) => const Page2Screen() 
      }
    );
  }
}