import 'package:flutter/material.dart';

class CallPage extends StatelessWidget {
  CallPage({super.key});
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Calls')),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (_, i) => ListTile(
          leading: const Icon(Icons.call),
          title: Text('Contact $i'),
          subtitle: const Text('Yesterday'),
        ),
      ),
    );
  }
}
