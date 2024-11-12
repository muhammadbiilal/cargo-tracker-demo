import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  bool _newLoadAlerts = true;
  bool _paymentNotifications = true;
  bool _routeUpdates = true;
  bool _emergencyAlerts = true;
  bool _maintenanceReminders = false;
  bool _weatherAlerts = true;
  bool _soundEnabled = true;
  bool _vibrationEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notification Settings'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          _buildSection(
            'Load Notifications',
            [
              _buildSwitchTile(
                'New Load Alerts',
                'Get notified about new load opportunities',
                _newLoadAlerts,
                (value) => setState(() => _newLoadAlerts = value),
              ),
              _buildSwitchTile(
                'Payment Notifications',
                'Receive updates about payments',
                _paymentNotifications,
                (value) => setState(() => _paymentNotifications = value),
              ),
            ],
          ),
          _buildSection(
            'Route & Safety',
            [
              _buildSwitchTile(
                'Route Updates',
                'Get notified about route changes and traffic',
                _routeUpdates,
                (value) => setState(() => _routeUpdates = value),
              ),
              _buildSwitchTile(
                'Emergency Alerts',
                'Receive critical safety and emergency notifications',
                _emergencyAlerts,
                (value) => setState(() => _emergencyAlerts = value),
              ),
              _buildSwitchTile(
                'Weather Alerts',
                'Get notifications about severe weather conditions',
                _weatherAlerts,
                (value) => setState(() => _weatherAlerts = value),
              ),
            ],
          ),
          _buildSection(
            'Vehicle',
            [
              _buildSwitchTile(
                'Maintenance Reminders',
                'Receive vehicle maintenance notifications',
                _maintenanceReminders,
                (value) => setState(() => _maintenanceReminders = value),
              ),
            ],
          ),
          _buildSection(
            'Notification Preferences',
            [
              _buildSwitchTile(
                'Sound',
                'Enable notification sounds',
                _soundEnabled,
                (value) => setState(() => _soundEnabled = value),
              ),
              _buildSwitchTile(
                'Vibration',
                'Enable vibration for notifications',
                _vibrationEnabled,
                (value) => setState(() => _vibrationEnabled = value),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSection(String title, List<Widget> children) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.grey[800],
            ),
          ),
        ),
        ...children,
        const Divider(),
      ],
    );
  }

  Widget _buildSwitchTile(
    String title,
    String subtitle,
    bool value,
    Function(bool) onChanged,
  ) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: onChanged,
    );
  }
}
