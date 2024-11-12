import 'package:flutter/material.dart';

class BankInfoScreen extends StatefulWidget {
  @override
  _BankInfoScreenState createState() => _BankInfoScreenState();
}

class _BankInfoScreenState extends State<BankInfoScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _isEditing = false;

  final _bankNameController = TextEditingController(text: 'ABC Bank');
  final _accountNumberController = TextEditingController(text: '****5678');
  final _routingNumberController = TextEditingController(text: '****9012');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bank Information'),
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
                          content:
                              Text('Bank information updated successfully!')),
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
              Text('Payment Information',
                  style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 16),
              _buildTextField(
                label: 'Bank Name',
                controller: _bankNameController,
                icon: Icons.account_balance,
              ),
              _buildTextField(
                label: 'Account Number',
                controller: _accountNumberController,
                icon: Icons.account_balance_wallet,
                obscureText: true,
              ),
              _buildTextField(
                label: 'Routing Number',
                controller: _routingNumberController,
                icon: Icons.confirmation_number,
                obscureText: true,
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
    bool obscureText = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextFormField(
        controller: controller,
        enabled: _isEditing,
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon),
          border: const OutlineInputBorder(),
        ),
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
