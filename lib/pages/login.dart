import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo
              Image.asset(
                'assets/images/logo.png', // Path to your logo image
                height: 150, // Set the height of the logo
              ),
              const SizedBox(height: 50), // Space between logo and buttons
              
              // Sign In button
              ElevatedButton(
                onPressed: () {
                  // Handle sign in action
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50), // Set button width and height
                ),
                child: const Text(
                  'Sign In',
                  style: TextStyle(
                    fontWeight: FontWeight.w800, // Set font weight to extra bold
                    fontSize: 16, // Set the font size
                  ),
                ),
              ),
              const SizedBox(height: 20), // Space between buttons

              // Sign Up button
              ElevatedButton(
                onPressed: () {
                  // Handle sign up action
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50), // Set button width and height
                ),
                child: const Text(
                  'Sign Up',
                  style: TextStyle(
                    fontWeight: FontWeight.w800, // Set font weight to extra bold
                    fontSize: 16, // Set the font size
                  ),
                ),
              ),
              const SizedBox(height: 20), // Space between buttons

              // Guest button
              ElevatedButton(
                onPressed: () {
                  // Handle guest action
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50), // Set button width and height
                ),
                child: const Text(
                  'Guest',
                  style: TextStyle(
                    fontWeight: FontWeight.w800, // Set font weight to extra bold
                    fontSize: 16, // Set the font size
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
