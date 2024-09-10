import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lotto_app/pages/first.dart';
import 'package:lotto_app/pages/editprofile.dart';
import 'package:lotto_app/pages/home.dart';
import 'package:lotto_app/pages/mylotto.dart';

class ProfilePage extends StatefulWidget {
  int uid = 0;
  ProfilePage({super.key, required this.uid});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late Future<Map<String, dynamic>> _userProfile;

  @override
  void initState() {
    super.initState();
    _userProfile = fetchUserProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          decoration: BoxDecoration(
            color: Colors.white, // สีพื้นหลัง
            borderRadius: BorderRadius.circular(10), // มุมโค้ง
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2), // เงา
                spreadRadius: 2,
                blurRadius: 4,
                offset: Offset(0, 2), // เงา
              ),
            ],
          ),
          child: FutureBuilder<Map<String, dynamic>>(
            future: fetchUserProfile(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: Text(
                    'Loading...',
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 22, // Increased font size for better visibility
                      color: Color.fromARGB(255, 0, 0, 0), // Changed text color to blue
                      letterSpacing:
                          1.2, // Added letter spacing for a cleaner look
                      shadows: [
                        Shadow(
                          offset: Offset(1, 1), // Shadow offset
                          // color: Colors.black.withOpacity(0.5), // Shadow color
                          blurRadius: 2, // Shadow blur radius
                        ),
                      ],
                    ),
                  ),
                );
              } else if (snapshot.hasError) {
                return const Center(
                  child: Text(
                    'Error',
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 22, // Increased font size for better visibility
                      color: Color.fromARGB(255, 0, 0, 0), // Changed text color to blue
                      letterSpacing:
                          1.2, // Added letter spacing for a cleaner look
                      shadows: [
                        Shadow(
                          offset: Offset(1, 1), // Shadow offset
                          // color: Colors.black.withOpacity(0.5), // Shadow color
                          blurRadius: 2, // Shadow blur radius
                        ),
                      ],
                    ),
                  ),
                );
              } else if (snapshot.hasData) {
                final user = snapshot.data!;
                return Center(
                  child: Text(
                    'Balance : ${user['balance'] ?? 'Unknown'} ฿',
                    style: const TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 22, // Increased font size for better visibility
                      color: Color.fromARGB(
                          255, 47, 188, 64), // Changed text color to blue
                      letterSpacing:
                          1.2, // Added letter spacing for a cleaner look
                      shadows: [
                        Shadow(
                          offset: Offset(1, 1), // Shadow offset
                          // color: Colors.black.withOpacity(0.5), // Shadow color
                          blurRadius: 2, // Shadow blur radius
                        ),
                      ],
                    ),
                  ),
                );
              } else {
                return const Center(
                  child: Text(
                    'No data',
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 20,
                    ),
                  ),
                );
              }
            },
          ),
        ),
        automaticallyImplyLeading: false,
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
                        'My Profile',
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 25.0),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFD9D9D9),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    width: 380,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              const SizedBox(width: 20),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      user['username'] ?? 'Unknown',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                    Text(
                                      user['email'] ?? 'Unknown',
                                      style: const TextStyle(
                                        color:
                                            Color.fromARGB(255, 133, 133, 133),
                                        fontSize: 16,
                                      ),
                                    ),
                                    Text(
                                      user['balance'].toString() ?? 'Unknown',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w800,
                                        color: Color.fromARGB(255, 0, 0, 0),
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
                            height: 400,
                            child: Container(
                              color: const Color(0xFFFFFFFF),
                              width: double.infinity,
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        const Expanded(
                                          child: Text(
                                            'Personal Information',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w900,
                                              fontSize: 20,
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    EditProfilePage(
                                                        uid: widget.uid),
                                              ),
                                            );
                                          },
                                          child: const Text(
                                            'Edit',
                                            style: TextStyle(
                                              color: Colors.blue,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 20),
                                    Row(
                                      children: [
                                        const Text(
                                          'Name:',
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w900,
                                          ),
                                        ),
                                        const Spacer(),
                                        Text(
                                          user['username'] ?? 'Unknown',
                                          style: const TextStyle(
                                            fontSize: 20,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 20),
                                    Row(
                                      children: [
                                        const Text(
                                          'Email:',
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w900,
                                          ),
                                        ),
                                        const Spacer(),
                                        Text(
                                          user['email'] ?? 'Unknown',
                                          style: const TextStyle(
                                            fontSize: 20,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 20),
                                    Row(
                                      children: [
                                        const Text(
                                          'Phone:',
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w900,
                                          ),
                                        ),
                                        const Spacer(),
                                        Text(
                                          user['phone'] ?? 'Unknown',
                                          style: const TextStyle(
                                            fontSize: 20,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 20),
                                    // Row(
                                    //   children: [
                                    //     const Text(
                                    //       'Password:',
                                    //       style: TextStyle(
                                    //         fontSize: 20,
                                    //         fontWeight: FontWeight.w900,
                                    //       ),
                                    //     ),
                                    //     const Spacer(),
                                    //     Text(
                                    //       user['password'] != null &&
                                    //               user['password'].isNotEmpty
                                    //           ? user['password']
                                    //                   .substring(0, 1) +
                                    //               '*' *
                                    //                   (user['password'].length -
                                    //                       1)
                                    //           : 'Unknown',
                                    //       style: const TextStyle(
                                    //         fontSize: 20,
                                    //       ),
                                    //     ),
                                    //   ],
                                    // ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 252, 26, 26),
                            minimumSize: const Size(double.infinity, 50),
                          ),
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FirstPage()),
                            );
                          },
                          child: const Text(
                            'Log Out',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: 'My Lotto',
          ),
        ],
        selectedItemColor: const Color(0xFF453BC9),
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        onTap: (int index) {
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomePage(
                  uid: widget.uid,
                ),
              ),
            );
          } else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Mylotto(
                  uid: widget.uid,
                ),
              ),
            );
          } else {
            print("Selected tab: $index");
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
      // Decode the response as a list
      final List<dynamic> userList = json.decode(response.body);

      // Check if the list is not empty
      if (userList.isNotEmpty) {
        // Return the first user object in the list
        return userList[0];
      } else {
        // Handle the case where the list is empty
        throw Exception('User not found');
      }
    } else {
      print('Failed to load profile, status code: ${response.statusCode}');
      print('Response body: ${response.body}');
      throw Exception('Failed to load user profile');
    }
  }
}
