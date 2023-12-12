import 'package:flutter/material.dart';
import 'package:singinterpreter/app/app.dart';
import 'package:singinterpreter/app/view/splash%20screen/slplash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const primary = Color(0xFF40B7AD);
    const textColor = Color(0xFF4A4A4A);
    const backgroundColor = Color(0xFFF5F5F5);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: primary),
        scaffoldBackgroundColor: backgroundColor,
        textTheme: const TextTheme(
          bodyText1: TextStyle(
            fontFamily: 'CascadiaCode',
            fontSize: 16,
            color: textColor,
          ),
        ),
        useMaterial3: true,
      ),
      home: WelcomeScreen(),
      debugShowCheckedModeBanner: false, // Desactiva el banner de "debug"
    );
  }
}
