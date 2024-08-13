import 'dart:convert'; // For encoding the request body
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; // For making HTTP requests
import 'package:lotto_app/pages/home.dart';
import 'package:lotto_app/pages/register.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _rememberMe = false;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

Future<void> _login() async {
  final username = _usernameController.text;
  final password = _passwordController.text;

  if (username.isEmpty || password.isEmpty) {
    _showErrorDialog('Please fill in both username and password.');
    return;
  }

  try {
    final response = await http.post(
      Uri.parse('https://nodejs-wfjd.onrender.com/login'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'username': username,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);

      if (jsonData is List) {
        final user = jsonData.firstWhere(
          (user) => user['username'] == username && user['password'] == password,
          orElse: () => null,
        );

        if (user != null) {
          print('Login successful: $user');
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomePage()), // เปลี่ยนเป็น HomePage
          );
        } else {
          _showErrorDialog('Login failed: Incorrect username or password.');
        }
      } else {
        _showErrorDialog('Unexpected data format.');
      }
    } else {
      _showErrorDialog('Failed to login. Status code: ${response.statusCode}');
    }
  } catch (e) {
    _showErrorDialog('An error occurred: $e');
  }
}


  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
        backgroundColor: const Color(0xFF453BC9),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Top section with background color
            Container(
              color: const Color(0xFF453BC9),
              height: 100,
              width: double.infinity,
              child: const Center(
                child: Text(
                  'Sign In',
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
            // Remaining part of the screen with input fields
            Container(
              color: const Color.fromARGB(255, 255, 255, 255),
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Username input field with icon
                  const SizedBox(height: 120.0),
                  TextField(
                    controller: _usernameController,
                    decoration: const InputDecoration(
                      labelText: 'Username',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(45.0)), // Rounded corners with 45-degree angle
                      ),
                      prefixIcon: Icon(Icons.person), // User icon
                    ),
                  ),
                  const SizedBox(height: 20.0), // Space between input fields
                  // Password input field with icon
                  TextField(
                    controller: _passwordController,
                    obscureText: true, // Obscure text for password
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(45.0)), // Rounded corners with 45-degree angle
                      ),
                      prefixIcon: Icon(Icons.lock), // Lock icon
                    ),
                  ),
                  const SizedBox(height: 10.0), // Space before the remember me checkbox
                  // Remember me checkbox
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                            value: _rememberMe,
                            onChanged: (bool? value) {
                              setState(() {
                                _rememberMe = value ?? false;
                              });
                            },
                          ),
                          const Text(
                            'Remember Me',
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ],
                      ),
                      // Forgot Password link
                      TextButton(
                        onPressed: () {
                          // Handle forgot password action
                        },
                        child: const Text(
                          'Forgot Password?',
                          style: TextStyle(color: Color(0xFF453BC9)),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 100.0), // Space before the button
                  // Sign in button
                  ElevatedButton(
                    onPressed: _login,
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
                      'Sign In Account',
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0), // Space before the sign-up text
                  // Sign up text with link
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "If you have no account, ",
                        style: TextStyle(fontSize: 16.0),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => RegisterPage()),
                          );
                        },
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Color(0xFF453BC9),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 100.0),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
