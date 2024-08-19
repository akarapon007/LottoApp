import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
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
                  'My Profile',
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
            // Box with BoxDecoration color D9D9D9
            Container(
              height: 600,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xFFD9D9D9), // Set the background color to D9D9D9
                borderRadius: BorderRadius.circular(10), // Optional: Add rounded corners
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26, // Optional: Add shadow for depth
                    blurRadius: 4,
                    offset: Offset(2, 2),
                  ),
                ],
              ),
              margin: const EdgeInsets.all(16.0),
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Profile picture and details at the top
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 50, // Adjust the radius to fit your design
                          // backgroundImage: NetworkImage(
                          //   'https://www.example.com/profile.jpg', // Replace with the user's profile image URL
                          // ),
                          backgroundColor: Colors.transparent,
                        ),
                        SizedBox(width: 16), // Space between profile picture and text
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'User Name', // Replace with the user's name
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                            Text(
                              'user@example.com', // Replace with the user's email
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 20), // Space below the profile information
                    // Additional content can be added here
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
