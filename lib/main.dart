import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'screens/main_screen.dart';

void main() {
  runApp(const MyApp());
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter FlashLight App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Oxygen",
      ),
      home: const MainScreen(),
    );
  }
}
