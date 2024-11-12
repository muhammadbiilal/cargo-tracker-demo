import 'package:demo_wireframing/screens/dashboard/dashboard_screen.dart';
import 'package:demo_wireframing/screens/signup/personal_info_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email/Username',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email or username';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
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
                child: const Text('Login'),
              ),
              TextButton(
                onPressed: () {
                  // Handle forgot password
                },
                child: const Text('Forgot Password?'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('New Driver?'),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PersonalInfoScreen(),
                        ),
                      );
                    },
                    child: const Text('Sign up here'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
