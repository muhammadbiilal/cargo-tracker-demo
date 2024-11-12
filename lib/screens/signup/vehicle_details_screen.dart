import 'package:demo_wireframing/screens/signup/emergency_contact_screen.dart';
import 'package:flutter/material.dart';

class VehicleDetailsScreen extends StatefulWidget {
  @override
  _VehicleDetailsScreenState createState() => _VehicleDetailsScreenState();
}

class _VehicleDetailsScreenState extends State<VehicleDetailsScreen> {
  final _formKey = GlobalKey<FormState>();
  final _registrationController = TextEditingController();
  String? _selectedVehicleType;
  String? _vehicleInfo;
  bool _isLoading = false;

  final List<String> _vehicleTypes = ['Tractor', 'Trailer'];

  Future<void> _fetchVehicleInformation() async {
    setState(() {
      _isLoading = true;
      _vehicleInfo = null;
    });

    try {
      // Simulate a network call with a delay
      await Future.delayed(const Duration(seconds: 2));

      // Dummy vehicle information
      setState(() {
        _vehicleInfo = 'Vehicle Model: XYZ\nYear: 2020\nOwner: John Doe';
      });
    } catch (e) {
      setState(() {
        _vehicleInfo = 'Failed to fetch vehicle information.';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vehicle Details'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              DropdownButtonFormField<String>(
                value: _selectedVehicleType,
                decoration: const InputDecoration(
                  labelText: 'Vehicle Type',
                  border: OutlineInputBorder(),
                ),
                items: _vehicleTypes.map((type) {
                  return DropdownMenuItem(
                    value: type,
                    child: Text(type),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedVehicleType = value;
                  });
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _registrationController,
                decoration: const InputDecoration(
                  labelText: 'Vehicle Registration Number',
                  border: OutlineInputBorder(),
                ),
                textCapitalization: TextCapitalization.characters,
              ),
              const SizedBox(height: 16),
              ElevatedButton.icon(
                onPressed: _isLoading ? null : _fetchVehicleInformation,
                icon: _isLoading
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(color: Colors.white),
                      )
                    : const Icon(Icons.search),
                label: const Text('Fetch Vehicle Information'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
              ),
              if (_vehicleInfo != null) ...[
                const SizedBox(height: 16),
                Text(
                  _vehicleInfo!,
                  style: const TextStyle(fontSize: 16),
                ),
              ],
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EmergencyContactScreen(),
                      ));
                },
                child: const Padding(
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
    _registrationController.dispose();
    super.dispose();
  }
}
