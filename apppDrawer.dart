import 'package:flutter/material.dart';
import 'package:flutter_2/lesson_6/callPage.dart';
import 'package:flutter_2/lesson_6/contactsPage.dart';
import 'package:flutter_2/lesson_6/settingsPage.dart';

class AppDrawer extends StatelessWidget {
  final ThemeMode themeMode;
  final VoidCallback onToggleTheme;

  const AppDrawer({
    super.key,
    required this.themeMode,
    required this.onToggleTheme,
  });
  @override
  Widget build(BuildContext context) {
    final cherrygramBlue = Color(0xFF2AABEE);
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            height: 170,
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(color: cherrygramBlue),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, size: 34, color: cherrygramBlue),
                ),
                SizedBox(height: 14),
                Text(
                  'User name',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('123 456 789', style: TextStyle(color: Colors.white)),
              ],
            ),
          ),

          drawerItem(
            context,
            icon: Icons.chat_rounded,
            title: 'Chats',
            onTap: () => Navigator.pop(context),
          ),
          drawerItem(
            context,
            icon: Icons.call,
            title: 'Calls',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => CallPage()),
              );
            },
          ),

          drawerItem(
            context,
            icon: Icons.contacts,
            title: 'Contacts',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => ContactsPage()),
              );
            },
          ),

          Divider(),

          drawerItem(
            context,
            icon: Icons.settings,
            title: 'Settings',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => SettingsPage()),
              );
            },
          ),

          drawerItem(
            context,
            icon: Icons.notifications,
            title: 'Notifications',
            onTap: () => Navigator.pop(context),
          ),

          Divider(),

          drawerItem(
            context,
            icon: Icons.privacy_tip,
            title: 'Privacy Policy',
            onTap: () => Navigator.pop(context),
          ),

          drawerItem(
            context,
            icon: Icons.help_center,
            title: 'Help',
            onTap: () => Navigator.pop(context),
          ),

          Divider(),

          SwitchListTile(
            title: const Text('Dark theme'),
            value: themeMode == ThemeMode.dark,
            onChanged: (_) => onToggleTheme(),
          ),
        ],
      ),
    );
  }

  Widget drawerItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.black),
      title: Text(title),
      onTap: onTap,
    );
  }
}
