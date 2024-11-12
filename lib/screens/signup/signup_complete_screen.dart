import 'package:demo_wireframing/screens/dashboard/dashboard_screen.dart';
import 'package:flutter/material.dart';

class SignUpCompleteScreen extends StatelessWidget {
  final String driverName;

  const SignUpCompleteScreen({
    Key? key,
    required this.driverName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.check_circle,
                  color: Colors.green,
                  size: 80,
                ),
                SizedBox(height: 24),
                Text(
                  'Welcome, $driverName!',
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 12),
                Text(
                  'Your account is ready.',
                  style: Theme.of(context).textTheme.titleLarge,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 48),
                ElevatedButton(
                  onPressed: () {
                    // TODO: Navigate to dashboard and clear navigation stack
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DashboardScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 48, vertical: 16),
                    backgroundColor: Colors.green,
                  ),
                  child: Text(
                    'Proceed to Dashboard',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
