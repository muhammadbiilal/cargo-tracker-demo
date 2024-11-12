import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _isEditing = false;

  // Form controllers
  final _nameController = TextEditingController(text: 'John Doe');
  final _phoneController = TextEditingController(text: '(555) 123-4567');
  final _emailController = TextEditingController(text: 'john.doe@example.com');
  final _vehicleRegController = TextEditingController(text: 'XYZ-123');
  final _emergencyNameController = TextEditingController(text: 'Jane Doe');
  final _emergencyPhoneController =
      TextEditingController(text: '(555) 987-6543');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Management'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(_isEditing ? Icons.save : Icons.edit),
            onPressed: () {
              setState(() {
                if (_isEditing) {
                  if (_formKey.currentState!.validate()) {
                    // TODO: Save changes
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text('Profile updated successfully!')),
                    );
                  }
                }
                _isEditing = !_isEditing;
              });
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Personal Information',
                  style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 16),
              _buildTextField(
                label: 'Full Name',
                controller: _nameController,
                icon: Icons.person,
              ),
              _buildTextField(
                label: 'Phone Number',
                controller: _phoneController,
                icon: Icons.phone,
                keyboardType: TextInputType.phone,
              ),
              _buildTextField(
                label: 'Email',
                controller: _emailController,
                icon: Icons.email,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 24),
              Text('Vehicle Information',
                  style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 16),
              _buildTextField(
                label: 'Vehicle Registration',
                controller: _vehicleRegController,
                icon: Icons.directions_car,
              ),
              const SizedBox(height: 24),
              Text('Emergency Contact',
                  style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 16),
              _buildTextField(
                label: 'Emergency Contact Name',
                controller: _emergencyNameController,
                icon: Icons.contact_phone,
              ),
              _buildTextField(
                label: 'Emergency Contact Phone',
                controller: _emergencyPhoneController,
                icon: Icons.phone,
                keyboardType: TextInputType.phone,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    required IconData icon,
    TextInputType? keyboardType,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextFormField(
        controller: controller,
        enabled: _isEditing,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon),
          border: const OutlineInputBorder(),
        ),
        keyboardType: keyboardType,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter $label';
          }
          return null;
        },
      ),
    );
  }
}
