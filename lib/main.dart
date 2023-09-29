import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo/global/global.dart';
import 'package:todo/screens/mobile_screens/contentscreen.dart';
import 'package:todo/screens/mobile_screens/homescreen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.white.withAlpha(0)));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: bgColor,
        brightness: Brightness.dark,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.black,
        ),
        useMaterial3: true,
        colorSchemeSeed: themeColor,
      ),
      // home: const HomeScreen(),
      home: const HomeScreen(),
    );
  }
}
