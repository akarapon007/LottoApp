import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lotto_app/config/config.dart';
import 'package:lotto_app/models/response/lottoGetRes.dart';
import 'package:lotto_app/models/response/user_idx_res.dart';
import 'package:lotto_app/pages/profile.dart';
import 'package:lotto_app/pages/home.dart';

class Mylotto extends StatefulWidget {
  final int uid;
  Mylotto({super.key, required this.uid});

  @override
  State<Mylotto> createState() => _MylottoState();
}

class _MylottoState extends State<Mylotto> {
  List<UserIdxRes> usergetRes = [];
  List<LottoGetRes> lottoGetResUser = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchLottoData();
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
          backgroundColor: const Color(0xFF453BC9),
          automaticallyImplyLeading: false,
        ),
      body: isLoading
      
          ? const Center(child: CircularProgressIndicator())
          : lottoGetResUser.isEmpty
              ? const Center(
                  child: Text(
                    'No lottery tickets purchased',
                    style: TextStyle(
                      color: Color(0xFF453BC9),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              : buildLottoList(),
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
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProfilePage(
                  uid: widget.uid,
                ),
              ),
            );
          } else if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomePage(
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

  Widget buildLottoList() {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      itemCount: lottoGetResUser.length,
      itemBuilder: (context, index) {
        var lotto = lottoGetResUser[index];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: SizedBox(
            height: 116, // Adjust the height as needed
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    border: Border.all(
                      color: Colors.black,
                      width: 1.5,
                    ),
                    color: const Color(0xFFFFFFFF),
                  ),
                  child: Column(
                    children: [
                      // Lotto header
                      Padding(
                        padding: const EdgeInsets.only(left: 0, top: 0),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            padding: const EdgeInsets.all(4.0),
                            width: MediaQuery.of(context).size.width / 4,
                            decoration: BoxDecoration(
                              color: const Color(0xFF453BC9),
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 20,
                                  height: 20,
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                const SizedBox(width: 6),
                                const Text(
                                  'Lotto',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 10, left: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: List.generate(
                                lotto.number.split('').length, (i) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 3.0),
                                child: Container(
                                  height: 38,
                                  width: 38,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 1.5,
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      lotto.number.split('')[i], // Each number
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 80,
                  right: 10,
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: const BoxDecoration(
                      color: Colors.transparent,
                    ),
                    child: Text(
                      '${lotto.price} Baht',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 28,
                  right: 10,
                  child: ElevatedButton(
                    onPressed: () async {
                      try {
                        var response = await http.put(
                          Uri.parse('https://nodejs-wfjd.onrender.com/lotto/prize'),
                          headers: <String, String>{
                            'Content-Type': 'application/json; charset=UTF-8',
                          },
                          body: jsonEncode(<String, dynamic>{
                            'lid': lotto.lottery_id,
                            'uid': widget.uid,
                            'money': lotto.prize,
                          }),
                        );
                        if (response.statusCode == 200) {
                          print('Lotto checked successfully for ID: ${lotto.lottery_id}');
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Lotto checked successfully!'),
                            ),
                          );
                        } else {
                          print('Failed to check lotto for ID: ${lotto.lottery_id}');
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Failed to check lotto.'),
                            ),
                          );
                        }
                      } catch (e) {
                        print('Error: $e');
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Error: $e')),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF453BC9),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12.0, vertical: 6.0),
                      minimumSize: const Size(69, 30),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: const Text(
                      'Check',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
  Future<void> fetchLottoData() async {
    setState(() {
      isLoading = true;
    });
    try {
      var jsonlotto = await http.get(Uri.parse(
          'https://nodejs-wfjd.onrender.com/lotto/lottouser/${widget.uid}'));
      if (jsonlotto.statusCode == 200 || jsonlotto.statusCode == 201) {
        var lottoData = lottoGetResFromJson(jsonlotto.body);
        setState(() {
          this.lottoGetResUser = lottoData;
          isLoading = false;
        });
      } else {
        setState(() {
          isLoading = false;
        });
        print('Failed to load lotto data: ${jsonlotto.statusCode}');
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error fetching lotto data: $e')),
      );
    }
  }
  Future<Map<String, dynamic>> fetchUserProfile() async {
    final response = await http.get(
      Uri.parse('https://nodejs-wfjd.onrender.com/users/${widget.uid}'),
    );

    if (response.statusCode == 200) {
      final List<dynamic> userList = json.decode(response.body);
      if (userList.isNotEmpty) {
        return userList[0];
      } else {
        throw Exception('User not found');
      }
    } else {
      print('Failed to load profile, status code: ${response.statusCode}');
      print('Response body: ${response.body}');
      throw Exception('Failed to load user profile');
    }
  }
}
