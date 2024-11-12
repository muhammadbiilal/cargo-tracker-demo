import 'package:flutter/material.dart';
import 'settings/profile_screen.dart';
import 'settings/bank_info_screen.dart';
import 'settings/notification_screen.dart';
import 'settings/privacy_screen.dart';
import 'settings/help_screen.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Profile Management'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfileScreen()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.account_balance),
            title: const Text('Bank Information'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BankInfoScreen()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.notifications),
            title: const Text('Notification Settings'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const NotificationScreen()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.security),
            title: const Text('Privacy Settings'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PrivacyScreen()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.help),
            title: const Text('Help & Support'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HelpScreen()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Log Out'),
            onTap: () {
              // Show logout confirmation dialog
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Logout'),
                    content: const Text('Are you sure you want to logout?'),
                    actions: [
                      TextButton(
                        child: const Text('Cancel'),
                        onPressed: () => Navigator.pop(context),
                      ),
                      TextButton(
                        child: const Text('Logout'),
                        onPressed: () {
                          // TODO: Implement logout logic
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
