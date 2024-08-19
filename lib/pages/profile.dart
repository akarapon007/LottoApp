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
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xFFD9D9D9), // Set the background color to D9D9D9
                borderRadius: BorderRadius.circular(10), // Optional: Add rounded corners
                boxShadow:const  [
                  BoxShadow(
                    color: Colors.black26, // Optional: Add shadow for depth
                    blurRadius: 4,
                    offset: Offset(2, 2),
                  ),
                ],
              ),
              margin: const EdgeInsets.all(16.0),
              child: const Center(
                
              ),
            ),
          ],
        ),
      ),
    );
  }
}
