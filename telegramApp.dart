import 'package:flutter/material.dart';
import 'package:flutter_2/lesson_6/homePage.dart';

class TelegramApp extends StatefulWidget {
  const TelegramApp({super.key});

  @override
  State<TelegramApp> createState() => _TelegramAppState();
}

class _TelegramAppState extends State<TelegramApp> {
  ThemeMode _themeMode = ThemeMode.light;

  void toggleTheme() {
    setState(() {
      _themeMode = _themeMode == ThemeMode.light
          ? ThemeMode.dark
          : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cherrygram',
      themeMode: _themeMode,

      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        colorSchemeSeed: const Color(0xFF2AABEE),
      ),

      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),

      home: HomePage(
        themeMode: _themeMode,
        onToggleTheme: toggleTheme,
      ),
    );
  }
}

