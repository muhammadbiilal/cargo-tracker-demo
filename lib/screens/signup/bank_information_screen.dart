import 'package:demo_wireframing/screens/signup/vehicle_details_screen.dart';
import 'package:flutter/material.dart';

class BankInformationScreen extends StatefulWidget {
  @override
  _BankInformationScreenState createState() => _BankInformationScreenState();
}

class _BankInformationScreenState extends State<BankInformationScreen> {
  final _formKey = GlobalKey<FormState>();
  final _bankNameController = TextEditingController();
  final _accountNumberController = TextEditingController();
  final _routingNumberController = TextEditingController();
  bool _isConfirmed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bank Information'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _bankNameController,
                decoration: InputDecoration(
                  labelText: 'Bank Name',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _accountNumberController,
                decoration: InputDecoration(
                  labelText: 'Account Number',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _routingNumberController,
                decoration: InputDecoration(
                  labelText: 'Routing Number',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 16),
              CheckboxListTile(
                value: _isConfirmed,
                onChanged: (value) {
                  setState(() {
                    _isConfirmed = value!;
                  });
                },
                title: Text('I confirm the above details are accurate'),
                controlAffinity: ListTileControlAffinity.leading,
              ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => VehicleDetailsScreen(),
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
    _bankNameController.dispose();
    _accountNumberController.dispose();
    _routingNumberController.dispose();
    super.dispose();
  }
}
