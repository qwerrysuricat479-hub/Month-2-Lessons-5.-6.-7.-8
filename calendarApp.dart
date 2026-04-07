import 'package:flutter/material.dart';
import 'package:flutter_2/lesson%208/calendarPage.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class CalendarApp extends StatefulWidget {
  CalendarApp({super.key});

  @override
  State<CalendarApp> createState() => _CalendarAppState();
}

class _CalendarAppState extends State<CalendarApp> {
  Locale _locale = Locale('ru');

  void _toggleLanguage() {
    setState(() {
      _locale = _locale.languageCode == 'ru' ? Locale('en') : Locale('ru');
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: _locale,
      supportedLocales: [
        Locale('ru'), 
        Locale('en')],
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate, 
      ],
      title: 'Калкндарь',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.lightBlueAccent,
      ),
      home: CalendarPage(onToggleLanguage: _toggleLanguage),

    );
  }
}
