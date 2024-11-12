import 'package:flutter/material.dart';

class PrivacyScreen extends StatefulWidget {
  const PrivacyScreen({super.key});

  @override
  _PrivacyScreenState createState() => _PrivacyScreenState();
}

class _PrivacyScreenState extends State<PrivacyScreen> {
  bool _locationSharing = true;
  bool _dataCollection = true;
  bool _shareAnalytics = false;
  String _selectedDataRetention = '3 months';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Privacy Settings'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          _buildSection(
            'Location Privacy',
            [
              SwitchListTile(
                title: const Text('Location Sharing'),
                subtitle:
                    const Text('Share location data while on active delivery'),
                value: _locationSharing,
                onChanged: (value) {
                  setState(() => _locationSharing = value);
                },
              ),
            ],
          ),
          _buildSection(
            'Data Collection',
            [
              SwitchListTile(
                title: const Text('Usage Data Collection'),
                subtitle:
                    const Text('Collect app usage data to improve service'),
                value: _dataCollection,
                onChanged: (value) {
                  setState(() => _dataCollection = value);
                },
              ),
              SwitchListTile(
                title: const Text('Share Analytics'),
                subtitle: const Text('Share anonymous usage statistics'),
                value: _shareAnalytics,
                onChanged: (value) {
                  setState(() => _shareAnalytics = value);
                },
              ),
            ],
          ),
          _buildSection(
            'Data Retention',
            [
              ListTile(
                title: const Text('Data Retention Period'),
                subtitle: const Text('How long to keep your activity data'),
                trailing: DropdownButton<String>(
                  value: _selectedDataRetention,
                  items: [
                    '1 month',
                    '3 months',
                    '6 months',
                    '1 year',
                  ].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    if (newValue != null) {
                      setState(() {
                        _selectedDataRetention = newValue;
                      });
                    }
                  },
                ),
              ),
            ],
          ),
          _buildSection(
            'Privacy Actions',
            [
              ListTile(
                title: const Text('Download My Data'),
                leading: const Icon(Icons.download),
                onTap: () {
                  // TODO: Implement data download
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('Preparing your data for download...')),
                  );
                },
              ),
              ListTile(
                title: const Text('Delete My Data'),
                leading: const Icon(Icons.delete_forever, color: Colors.red),
                onTap: () {
                  _showDeleteConfirmation(context);
                },
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

  void _showDeleteConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete My Data'),
          content: const Text(
            'Are you sure you want to delete all your data? This action cannot be undone.',
          ),
          actions: [
            TextButton(
              child: const Text('Cancel'),
              onPressed: () => Navigator.pop(context),
            ),
            TextButton(
              child: const Text(
                'Delete',
                style: TextStyle(color: Colors.red),
              ),
              onPressed: () {
                Navigator.pop(context);
                // TODO: Implement data deletion
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Data deletion initiated...')),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
