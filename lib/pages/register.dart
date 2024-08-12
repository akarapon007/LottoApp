import 'package:flutter/material.dart';
import 'package:lotto_app/pages/login.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _isAccepted = false;
  // This variable will hold the selected profile image
  ImageProvider? _profileImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
        backgroundColor: const Color(0xFF453BC9),
      ),
      body: SingleChildScrollView( // Make the content scrollable
        child: Column(
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
            Container(
              color: Colors.white, // Background color for the rest of the screen
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Profile image section
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        // Handle image selection logic here
                        // For now, just simulate image selection
                        setState(() {
                          _profileImage = AssetImage('assets/default_profile.png'); // Replace with your default image
                        });
                      },
                      child: CircleAvatar(
                        radius: 50.0, // Adjust the radius as needed
                        backgroundImage: _profileImage,
                        child: _profileImage == null
                            ? const Icon(Icons.camera_alt, size: 40.0, color: Colors.white)
                            : null,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0), // Space between profile image and username field

                  const TextField(
                    decoration: InputDecoration(
                      labelText: 'Username',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(45.0)), // Rounded corners with 45-degree angle
                      ),
                      prefixIcon: Icon(Icons.person),
                    ),
                  ),
                  const SizedBox(height: 16.0), // Add space between text fields

                  const TextField(
                    decoration: InputDecoration(
                      labelText: 'Phone',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(45.0)), // Rounded corners with 45-degree angle
                      ),
                      prefixIcon: Icon(Icons.phone),
                    ),
                  ),
                  const SizedBox(height: 16.0), // Add space between text fields

                  const TextField(
                    decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(45.0)), // Rounded corners with 45-degree angle
                      ),
                      prefixIcon: Icon(Icons.email),
                    ),
                  ),
                  const SizedBox(height: 16.0), // Add space between text fields

                  const TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(45.0)), // Rounded corners with 45-degree angle
                      ),
                      prefixIcon: Icon(Icons.lock),
                    ),
                  ),
                  const SizedBox(height: 16.0), // Add space between text fields

                  const TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Confirm Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(45.0)), // Rounded corners with 45-degree angle
                      ),
                      prefixIcon: Icon(Icons.lock),
                    ),
                  ),
                  const SizedBox(height: 16.0), // Add space between text fields

                  Row(
                    children: [
                      Checkbox(
                        value: _isAccepted,
                        onChanged: (bool? value) {
                          setState(() {
                            _isAccepted = value ?? false;
                          });
                        },
                      ),
                      const Expanded(
                        child: Text(
                          'I accept the Terms & Conditions',
                          style: TextStyle(fontSize: 14.0),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24.0), // Add space before the button

                  // Center the button
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle sign-up action
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF453BC9), // Match button color
                        padding: const EdgeInsets.symmetric(
                          horizontal: 50.0,
                          vertical: 15.0,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(45.0), // Rounded button corners
                        ),
                      ),
                      child: const Text(
                        'Sign Up Account',
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0), // Space before the sign-up text

                  // Sign up text with link
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "If you have an account, ",
                        style: TextStyle(fontSize: 16.0),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => LoginPage()),
                          );
                        },
                        child: const Text(
                          'Sign In',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Color(0xFF453BC9),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
