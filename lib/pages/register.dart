import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lotto_app/pages/login.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _isAccepted = false;
  ImageProvider? _profileImage;

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  Future<void> _register() async {
    if (_usernameController.text.isEmpty ||
        _phoneController.text.isEmpty ||
        _emailController.text.isEmpty ||
        _passwordController.text.isEmpty ||
        _confirmPasswordController.text.isEmpty) {
      _showErrorDialog('Please fill out all the fields');
      return;
    }

    if (_passwordController.text != _confirmPasswordController.text) {
      _showErrorDialog('Passwords do not match');
      return;
    }

    if (!_isAccepted) {
      _showErrorDialog('You must accept the terms and conditions');
      return;
    }

    final String apiUrl = 'https://nodejs-wfjd.onrender.com/signup';
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'username': _usernameController.text,
        'phone': _phoneController.text,
        'email': _emailController.text,
        'password': _passwordController.text,
      }),
    );

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200 || response.statusCode == 201) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      if (data['success']) {
        _showSuccessDialog('Registration Successful');
      } else {
        _showErrorDialog(data['message'] ?? 'Registration failed');
      }
    } else {
      _showErrorDialog(
          'Failed to connect to the server. Status code: ${response.statusCode}');
    }
  }

  void _showSuccessDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Success'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
            ),
          ],
        );
      },
    );
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
                Navigator.of(context).pop(); // Close the dialog
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
            Container(
              color: const Color(0xFF453BC9),
              height: 50,
              width: double.infinity,
              child: const Center(
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10.0), // เพิ่มระยะห่างระหว่าง title และฟอร์ม

            // Container สำหรับฟอร์มสมัครสมาชิก
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFFD9D9D9), // สีพื้นหลังของฟอร์ม
                borderRadius: BorderRadius.circular(40.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(20.0),
              width: 370,
              height: 700,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _profileImage =
                              AssetImage('assets/default_profile.png');
                        });
                      },
                      child: CircleAvatar(
                        radius: 40.0,
                        backgroundImage: _profileImage,
                        child: _profileImage == null
                            ? const Icon(Icons.camera_alt,
                                size: 40.0, color: Colors.white)
                            : null,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  TextField(
                    controller: _usernameController,
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white, // สีพื้นหลังของช่องข้อความ
                      labelText: 'Username',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(45.0)),
                      ),
                      prefixIcon: Icon(Icons.person),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  TextField(
                    controller: _phoneController,
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white, // สีพื้นหลังของช่องข้อความ
                      labelText: 'Phone',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(45.0)),
                      ),
                      prefixIcon: Icon(Icons.phone),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  TextField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white, // สีพื้นหลังของช่องข้อความ
                      labelText: 'Email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(45.0)),
                      ),
                      prefixIcon: Icon(Icons.email),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white, // สีพื้นหลังของช่องข้อความ
                      labelText: 'Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(45.0)),
                      ),
                      prefixIcon: Icon(Icons.lock),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  TextField(
                    controller: _confirmPasswordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white, // สีพื้นหลังของช่องข้อความ
                      labelText: 'Confirm Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(45.0)),
                      ),
                      prefixIcon: Icon(Icons.lock),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    children: [
                      Theme(
                        data: ThemeData(
                          unselectedWidgetColor: Colors
                              .white, // สีของกรอบ Checkbox เมื่อยังไม่ติ๊ก
                        ),
                        child: Checkbox(
                          value: _isAccepted,
                          onChanged: (bool? value) {
                            setState(() {
                              _isAccepted = value ?? false;
                            });
                          },
                         checkColor: Colors.black, // สีของเครื่องหมายติ๊ก
                            fillColor: MaterialStateProperty.all<Color>(
                                Colors.white), // สีพื้นหลัง
                            side: MaterialStateBorderSide.resolveWith(
                              (states) =>
                                  const BorderSide(color: Colors.white), // สีของขอบ
                            ),
                        ),
                      ),
                      const Expanded(
                        child: Text(
                          'I accept the Terms & Conditions',
                          style: TextStyle(fontSize: 14.0),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24.0),
                  Center(
                    child: ElevatedButton(
                      onPressed: _register,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF453BC9),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 50.0,
                          vertical: 15.0,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(45.0),
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
                  const SizedBox(height: 20.0),
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
                            MaterialPageRoute(
                                builder: (context) => LoginPage()),
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
