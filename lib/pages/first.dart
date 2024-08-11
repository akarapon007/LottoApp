import 'package:flutter/material.dart';
import 'package:lotto_app/pages/login.dart';
import 'package:lotto_app/pages/register.dart';

class FirstPage extends StatelessWidget {
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
                height: 450, // Set the height of the logo
              ),
              const SizedBox(height: 20), // Space between logo and buttons
              
              // Sign In button
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF453BC9), // Set button background color
                  fixedSize: Size(250, 50), // Set button width and height
                ),
                child: const Text(
                  'Sign In',
                  style: TextStyle(
                    fontWeight: FontWeight.w800, // Set font weight to extra bold
                    fontSize: 24, // Set the font size
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 30), // Space between buttons

              // Sign Up button
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context, 
                    MaterialPageRoute(builder: (context) => RegisterPage())
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                  fixedSize: Size(250, 50), // Set button width and height
                ),
                child: const Text(
                  'Sign Up',
                  style: TextStyle(
                    fontWeight: FontWeight.w800, // Set font weight to extra bold
                    fontSize: 24, // Set the font size
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 30), // Space between buttons

              // Guest button
              ElevatedButton(
                onPressed: () {
                  // Handle guest action
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 83, 83, 83),
                  fixedSize: Size(250, 50), // Set button width and height
                ),
                child: const Text(
                  'Guest',
                  style: TextStyle(
                    fontWeight: FontWeight.w800, // Set font weight to extra bold
                    fontSize: 24, // Set the font size
                    color: Colors.white,
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
