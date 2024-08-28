import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lotto_app/pages/first.dart';
import 'package:lotto_app/pages/editprofile.dart';

class ProfilePage extends StatefulWidget {
  int uid = 0;
  ProfilePage({super.key, required this.uid});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late ImageProvider _profileImage;

  @override
  void initState() {
    super.initState();
    _profileImage = const NetworkImage(
      'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/c7bced49-73a3-43c1-b3ce-fe419a596a72/dg62wjw-dc323fd3-124f-4893-b86b-88c7b07c9399.png',
    ); // Default image
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
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
            final imageUrl = user['img'] ?? 'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/c7bced49-73a3-43c1-b3ce-fe419a596a72/dg62wjw-dc323fd3-124f-4893-b86b-88c7b07c9399.png';
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
                              GestureDetector(
                                onTap: () {
                                  // Handle image tap if needed
                                },
                                child: CircleAvatar(
                                radius: 40.0,
                                backgroundImage: NetworkImage(imageUrl),
                                child: imageUrl.isEmpty
                                    ? const Icon(Icons.camera_alt,
                                        size: 40.0, color: Colors.white)
                                    : null,
                              ),
                              ),
                              const SizedBox(width: 20),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                        color: Color.fromARGB(255, 133, 133, 133),
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
                                                builder: (context) => EditProfilePage(uid: widget.uid),
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
                            backgroundColor: const Color.fromARGB(255, 252, 26, 26),
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
