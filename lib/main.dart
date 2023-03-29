import 'package:exercise1_paml/auth/welcome_page.dart';
import 'package:exercise1_paml/home/home_page.dart';
import 'package:exercise1_paml/themes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Exercise 1 PAML',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(kYellowColor)
          ),
        )
      ),
      home: const HomePage(name: 'Andri Fanky'),
      // home: const WelcomePage(),
    );
  }
}
