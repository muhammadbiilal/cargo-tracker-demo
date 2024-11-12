import 'package:demo_wireframing/screens/signup/signup_complete_screen.dart';
import 'package:flutter/material.dart';

class DOTVerificationScreen extends StatefulWidget {
  @override
  _DOTVerificationScreenState createState() => _DOTVerificationScreenState();
}

class _DOTVerificationScreenState extends State<DOTVerificationScreen> {
  final _formKey = GlobalKey<FormState>();
  final _dotNumberController = TextEditingController();
  bool _isVerified = false;
  bool _isLoading = false;
  String? _verificationMessage;

  Future<void> _verifyDOT() async {
    setState(() {
      _isLoading = true;
      _verificationMessage = null;
    });

    try {
      // Simulate a network call with a delay
      await Future.delayed(const Duration(seconds: 2));

      // Dummy verification logic
      if (_dotNumberController.text == '123456') {
        setState(() {
          _isVerified = true;
          _verificationMessage = 'DOT number verified successfully!';
        });
      } else {
        setState(() {
          _isVerified = false;
          _verificationMessage = 'Verification failed. Invalid DOT number.';
        });
      }
    } catch (e) {
      setState(() {
        _isVerified = false;
        _verificationMessage = 'Verification failed. Please try again.';
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
        title: const Text('DOT Verification'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _dotNumberController,
                decoration: const InputDecoration(
                  labelText: 'DOT Number',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a DOT number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _isLoading
                    ? null
                    : () {
                        if (_formKey.currentState!.validate()) {
                          _verifyDOT();
                        }
                      },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: _isLoading
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(color: Colors.white),
                        )
                      : const Text('Verify DOT Number'),
                ),
              ),
              if (_verificationMessage != null) ...[
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color:
                        _isVerified ? Colors.green.shade50 : Colors.red.shade50,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: _isVerified ? Colors.green : Colors.red,
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        _isVerified ? Icons.check_circle : Icons.error,
                        color: _isVerified ? Colors.green : Colors.red,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          _verificationMessage!,
                          style: TextStyle(
                            color: _isVerified ? Colors.green : Colors.red,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignUpCompleteScreen(
                        driverName:
                            "John", // Replace with actual driver name from your data
                      ),
                    ),
                    (route) =>
                        false, // Removes all previous routes from the stack
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: _isVerified ? Colors.green : null,
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Text('Complete Sign-Up'),
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
    _dotNumberController.dispose();
    super.dispose();
  }
}
