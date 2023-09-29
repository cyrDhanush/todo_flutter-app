import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo/firebase_options.dart';
import 'package:todo/global/global.dart';
import 'package:todo/screens/mobile_screens/wrapper.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.white.withAlpha(0)));

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
        fontFamily: 'SourceSans',
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
        ),
        useMaterial3: true,
        colorSchemeSeed: themeColor,
      ),
      // home: const HomeScreen(),
      // home: const SignUpScreen(),
      home: const MobileWrapper(),
    );
  }
}
