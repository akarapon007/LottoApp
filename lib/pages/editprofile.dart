import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lotto_app/config/config.dart';
import 'package:lotto_app/pages/login.dart';

class EditProfilePage extends StatefulWidget {
  int uid = 0;
  EditProfilePage({super.key, required this.uid});

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool _isAccepted = false;

  final BoxDecoration _boxDecoration = BoxDecoration(
    color: const Color(0xFFD9D9D9),
    borderRadius: BorderRadius.circular(40.0),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.5),
        spreadRadius: 5,
        blurRadius: 7,
        offset: const Offset(0, 3),
      ),
    ],
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
        backgroundColor: const Color(0xFF453BC9),
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: fetchUserProfile(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error loading profile'));
          } else {
            final user = snapshot.data!;
            return SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    color: const Color(0xFF453BC9),
                    height: 50,
                    width: double.infinity,
                    child: const Center(
                      child: Text(
                        'Edit Profile',
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: _boxDecoration,
                    width: 380,
                    height: 530,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          const SizedBox(height: 16.0),
                          TextField(
                            controller: _usernameController,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: user['username'] ?? 'Username',
                              border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(45.0)),
                              ),
                              prefixIcon: const Icon(Icons.person),
                            ),
                          ),
                          const SizedBox(height: 16.0),
                          TextField(
                            controller: _emailController,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: user['email'] ?? 'Email',
                              border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(45.0)),
                              ),
                              prefixIcon: const Icon(Icons.email),
                            ),
                          ),
                          const SizedBox(height: 16.0),
                          TextField(
                            controller: _phoneController,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: user['phone'] ?? 'Phone',
                              border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(45.0)),
                              ),
                              prefixIcon: const Icon(Icons.phone),
                            ),
                          ),
                          const SizedBox(height: 16.0),
                          TextField(
                            controller: _passwordController,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: user['password'] ?? 'password',
                              border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(45.0)),
                              ),
                              prefixIcon: const Icon(Icons.lock),
                            ),
                          ),
                          const SizedBox(height: 16.0),
                          
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  SizedBox(
                    width: 200.0,
                    height: 50.0,
                    child: ElevatedButton(
                      onPressed:
                          saveData, // Corrected onPressed to call saveData
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF453BC9),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                      child: const Text(
                        'Update Profile', // Button label text
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }

  Future<Map<String, dynamic>> fetchUserProfile() async {
    final response = await http.get(
      Uri.parse('https://nodejs-wfjd.onrender.com/users/${widget.uid}'),
    );

    if (response.statusCode == 200) {
      final List<dynamic> userList = json.decode(response.body);

      if (userList.isNotEmpty) {
        final user = userList[0];

        _usernameController.text = user['username'] ?? '';
        _emailController.text = user['email'] ?? '';
        _phoneController.text = user['phone'] ?? '';
        

        return user;
      } else {
        throw Exception('User not found');
      }
    } else {
      print('Failed to load profile, status code: ${response.statusCode}');
      print('Response body: ${response.body}');
      throw Exception('Failed to load user profile');
    }
  }

//   Future<Map<String, dynamic>> fetchUserProfile() async {
//   final response = await http.get(
//     Uri.parse('https://nodejs-wfjd.onrender.com/users/${widget.uid}'),
//   );

//   if (response.statusCode == 200) {
//     final List<dynamic> userList = json.decode(response.body);

//     if (userList.isNotEmpty) {
//       return userList[0];
//     } else {
//       throw Exception('User not found');
//     }
//   } else {
//     print('Failed to load profile, status code: ${response.statusCode}');
//     print('Response body: ${response.body}');
//     throw Exception('Failed to load user profile');
//   }
// }

  void saveData() async {
    var value = await Configuration.getConfig();
    var url = value['apiEndPoint'];

    var json = {
      "fullname": _usernameController.text,
      "phone": _phoneController.text,
      "email": _emailController.text,
      "password" : _passwordController.text,
      
    };

    try {
      var res = await http.put(
        Uri.parse('https://nodejs-wfjd.onrender.com/users/${widget.uid}'),
        headers: {"Content-Type": "application/json; charset=utf-8"},
        body: jsonEncode(json),
      );

      log('Status code: ${res.statusCode}');
      log('Response body: ${res.body}');

      if (res.statusCode == 200) {
        var result = jsonDecode(res.body);

        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Success'),
            content: const Text('Data recorded successfully'),
            actions: [
              FilledButton(
                onPressed: () {
            //       Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => LoginPage()),
            // );
                },
                child: const Text('Close'),
              ),
            ],
          ),
        );
        log(result['message']);
      } else {
        throw Exception('Failed to update profile');
      }
    } catch (err) {
      log('Error updating profile: $err');
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Error'),
          content: const Text('Failed to update profile. Please try again.'),
          actions: [
            FilledButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Close'),
            ),
          ],
        ),
      );
    }
  }

  void _updateProfile() {
    print("Update Profile button pressed");
  }
}
