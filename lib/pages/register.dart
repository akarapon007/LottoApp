import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
        backgroundColor: const Color(0xFF453BC9),
      ),
      body: Column(
        children: [
          // Top section with background color
          Container(
            color: const Color(0xFF453BC9), // Set the background color to #453BC9
            height: 100, // Adjust the height as needed
            width: double.infinity, // Make the container full width
            child: const Center(
              child: Text(
                'Sign Up',
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  color: Colors.white, // Set text color to white
                  fontSize: 24, // Set font size
                ),
              ),
            ),
          ),
          // Remaining part of the screen
          Expanded(
            child: Container(
              color: Colors.white, // Background color for the rest of the screen
            ),
          ),
        ],
      ),
    );
  }
}
