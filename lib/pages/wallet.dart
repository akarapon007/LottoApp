import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class WalletPage extends StatefulWidget {
  int uid = 0;
  WalletPage({super.key, required this.uid});

  @override
  _WalletPageState createState() => _WalletPageState();
}
class _WalletPageState extends State<WalletPage> {
  late Future<Map<String, dynamic>> userData;

  @override
  void initState() {
    super.initState();
    userData = fetchUserData();
  }
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Balance and top-up history',
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
            ),
            SizedBox(height: 4.0),
            Text(
              "Let's take a look at your spending overview!",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        backgroundColor: const Color(0xFF453BC9),
        toolbarHeight: 70.0,
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: userData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final user = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(20.0),
                    margin: const EdgeInsets.only(bottom: 10.0),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 186, 186, 186),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    height: 200,
                    width: 350,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'account balance: ${user['balance'].toString()} Baht',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Image.network(
                            'https://static.vecteezy.com/system/resources/thumbnails/019/051/628/small_2x/gold-coin-money-symbol-icon-png.png',
                            width: 120,
                            height: 100,
                            errorBuilder: (context, error, stackTrace) {
                              return const Icon(
                                Icons.error,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: ListView.builder(
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 16.0),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Center(child: Text('No data available'));
          }
        },
      ),
    );
  }
  Future<Map<String, dynamic>> fetchUserData() async {
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
