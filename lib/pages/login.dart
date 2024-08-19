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
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _login() async {
    final phone = _phoneController.text;
    final password = _passwordController.text;

    if (phone.isEmpty || password.isEmpty) {
      _showErrorDialog('Please fill in both phone and password.');
      return;
    }

    try {
      final response = await http.post(
        Uri.parse('https://nodejs-wfjd.onrender.com/login'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'phone': phone,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);

        if (jsonData is List) {
          final user = jsonData.firstWhere(
            (user) => user['phone'] == phone && user['password'] == password,
            orElse: () => null,
          );

          if (user != null) {
            print('Login successful: $user');
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => HomePage()), // เปลี่ยนเป็น HomePage
            );
          } else {
            _showErrorDialog('Login failed: Incorrect phone or password.');
          }
        } else {
          _showErrorDialog('Unexpected data format.');
        }
      } else {
        _showErrorDialog(
            'Failed to login. Status code: ${response.statusCode}');
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
            const SizedBox(height: 10.0),
            // Remaining part of the screen with input fields
            Container(
              decoration: BoxDecoration(
                color: Color(0xFFD9D9D9), // เปลี่ยนสีพื้นหลังเป็น #D9D9D9
                borderRadius:
                    BorderRadius.circular(20), // ตั้งค่ามุมโค้งเป็น 20 พิกเซล
              ),
              padding: const EdgeInsets.all(20.0),
              height: 450,
              width: 350,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 50.0), // ลดขนาดจาก 120.0 เหลือ 20.0
                  TextField(
                    controller: _phoneController,
                    decoration: const InputDecoration(
                      labelText: 'Phone',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                            Radius.circular(45.0)), // มุมโค้ง 45 องศา
                      ),
                      prefixIcon: Icon(Icons.phone), // ไอคอนโทรศัพท์
                      fillColor: Colors.white, // ตั้งค่าสีพื้นหลัง
                      filled: true, // เปิดใช้งานสีพื้นหลัง
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  TextField(
                    controller: _passwordController,
                    obscureText: true, // ซ่อนข้อความสำหรับรหัสผ่าน
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                            Radius.circular(45.0)), // มุมโค้ง 45 องศา
                      ),
                      prefixIcon: Icon(Icons.lock), // ไอคอนล็อก
                      fillColor: Colors.white, // ตั้งค่าสีพื้นหลัง
                      filled: true, // เปิดใช้งานสีพื้นหลัง
                    ),
                  ),

                  const SizedBox(
                      height:
                          10.0), // เว้นระยะห่างก่อนช่องทำเครื่องหมายจำฉันไว้
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
                            checkColor: Colors.black, // สีของเครื่องหมายติ๊ก
                            fillColor: MaterialStateProperty.all<Color>(
                                Colors.white), // สีพื้นหลัง
                            side: MaterialStateBorderSide.resolveWith(
                              (states) =>
                                  BorderSide(color: Colors.white), // สีของขอบ
                            ),
                          ),
                          const Text(
                            'Remember Me',
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ],
                      ),
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
                  const SizedBox(height: 20.0), // ลดขนาดจาก 100.0 เหลือ 20.0
                  ElevatedButton(
                    onPressed: _login,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF453BC9), // สีของปุ่ม
                      padding: const EdgeInsets.symmetric(
                        horizontal: 50.0,
                        vertical: 15.0,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(45.0), // มุมโค้งของปุ่ม
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
                  const SizedBox(height: 10.0), // ลดขนาดจาก 20.0 เหลือ 10.0
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
                            MaterialPageRoute(
                                builder: (context) => RegisterPage()),
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
                  const SizedBox(height: 10.0), // ลดขนาดจาก 100.0 เหลือ 10.0
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
