import 'package:flutter/material.dart';

class ContactsPage extends StatelessWidget {
  ContactsPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Contacts')),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (_, i) =>
            ListTile(leading: const CircleAvatar(), title: Text('User $i')),
      ),
    );
  }
}
