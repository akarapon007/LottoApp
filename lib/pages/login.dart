import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lotto_app/config/config.dart';
import 'package:lotto_app/models/request/user_login_post.dart';
import 'package:lotto_app/models/response/user_idx_res.dart';
import 'package:lotto_app/pages/home.dart';
import 'package:lotto_app/pages/register.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String text = '';
  String url = '';
  bool _rememberMe = false;
  TextEditingController phoneCtl = TextEditingController();
  TextEditingController passwordCtl = TextEditingController();

  @override
  void initState() {
    super.initState();
    // อ่านค่า Config
    Configuration.getConfig().then(
      (value) {
        log(value['apiEndPoint']);
        setState(() {
          url = value['apiEndPoint'];
        });
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
                color: const Color(0xFFD9D9D9), // เปลี่ยนสีพื้นหลังเป็น #D9D9D9
                borderRadius:
                    BorderRadius.circular(20), // ตั้งค่ามุมโค้งเป็น 20 พิกเซล
              ),
              padding: const EdgeInsets.all(20.0),
              height: 500,
              width: 350,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 50.0), // ลดขนาดจาก 120.0 เหลือ 50.0
                  TextField(
                    controller: phoneCtl,
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
                    controller: passwordCtl,
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
                                  const BorderSide(color: Colors.white), // สีของขอบ
                            ),
                          ),
                          const Text(
                            'Remember Me',
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 60.0), // ลดขนาดจาก 100.0 เหลือ 60.0
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

  Future<void> _login() async {
    final phone = phoneCtl.text;
    final password = passwordCtl.text;

    if (phone.isEmpty || password.isEmpty) {
      _showErrorDialog('Please fill in both phone and password.');
      return;
    }

    try {
      final model = UserLoginReq(phone: phone, password: password);

      var response = await http.post(
        Uri.parse("$url/login"),
        headers: {"Content-Type": "application/json; charset=utf-8"},
        body: userLoginReqToJson(model),
      );

      if (response.statusCode == 200) {
        var cust = userIdxResFromJson(response.body);
        log(cust.toString()); 
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(
              userId: cust.uid,
            ),
          ),
        );
      } else {
        _showErrorDialog('Login failed. Please check your credentials.');
      }

    } catch (err) {
      log(err.toString());
      _showErrorDialog("An error occurred. Please try again.");
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
}
