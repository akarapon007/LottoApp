import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lotto_app/config/config.dart';
import 'package:lotto_app/models/request/user_login_post.dart';
import 'package:lotto_app/models/response/userLoginPostRes.dart';
import 'package:lotto_app/pages/home.dart';
import 'package:lotto_app/pages/register.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String text = '';
  int number = 0;
  String phoneNO = '';
  String password = '';
  bool _rememberMe = false;
  TextEditingController phoneCtl = TextEditingController();
  TextEditingController passwordCtl = TextEditingController();


  String url = '';
  
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
                    onPressed: login,
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

  void login() async {
   var model =
       UserLoginReq(phone: phoneCtl.text, password: passwordCtl.text);

    try {
      var value = await http.post(Uri.parse("$url/login"),
          headers: {"Content-Type": "application/json; charset=utf-8"},
          body: userLoginReqToJson(model));
      var cust = userLoginPostResFromJson(value.body);

      log(cust.user.img);
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(
              userId: cust.user.uid,
            ),
          ));
    } catch (err) {
      log(err.toString());
      setState(() {
        text = "Phone no or Password Incorrect";
      });
    }
  }
}