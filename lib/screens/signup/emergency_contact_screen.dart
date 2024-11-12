import 'package:demo_wireframing/screens/signup/dot_verification_screen.dart';
import 'package:flutter/material.dart';

class EmergencyContactScreen extends StatefulWidget {
  @override
  _EmergencyContactScreenState createState() => _EmergencyContactScreenState();
}

class _EmergencyContactScreenState extends State<EmergencyContactScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  String? _selectedRelationship;

  final List<String> _relationships = [
    'Family',
    'Friend',
    'Colleague',
    'Other'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Emergency Contact'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Emergency Contact Name',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _phoneController,
                decoration: InputDecoration(
                  labelText: 'Emergency Contact Phone Number',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a phone number';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: _selectedRelationship,
                decoration: InputDecoration(
                  labelText: 'Relationship',
                  border: OutlineInputBorder(),
                ),
                items: _relationships.map((relationship) {
                  return DropdownMenuItem(
                    value: relationship,
                    child: Text(relationship),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedRelationship = value;
                  });
                },
                validator: (value) {
                  if (value == null) {
                    return 'Please select a relationship';
                  }
                  return null;
                },
              ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DOTVerificationScreen(),
                      ));
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Text('Next'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }
}
