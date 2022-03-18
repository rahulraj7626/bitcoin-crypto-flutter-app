import 'package:flutter/material.dart';
import 'package:graph/screens/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool themeIsDark = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: themeIsDark ? ThemeData.dark() : ThemeData.light(),
        debugShowCheckedModeBanner: false,
        home: const MainScreen());
  }
}
