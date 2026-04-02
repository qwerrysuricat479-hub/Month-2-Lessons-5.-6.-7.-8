import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Imperative Navigation',
      home: FirstPage(),
    );
  }
}

class FirstPage extends StatelessWidget {
  FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First screen'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(155, 109, 223, 252),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SecondPage()),
            );
          },
          child: Text('Move to second screen'),
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second screen'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(155, 109, 200, 252),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ThirdPage()),
            );
          },
          child: Text('Move to third screen'),
        ),
      ),
    );
  }
}


class ThirdPage extends StatelessWidget {
  ThirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Third screen'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(155, 141, 167, 255),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.popUntil(
              context, (route) => route.isFirst
            );
          },
          child: Text('Move to home screen'),
        ),
      ),
    );
  }
}

