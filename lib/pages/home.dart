import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:lotto_app/config/config.dart';
import 'package:lotto_app/models/response/lottoGetRes.dart';
import 'package:lotto_app/pages/mylotto.dart';
import 'package:lotto_app/pages/profile.dart';
import 'package:http/http.dart' as http;
import 'package:pinput/pinput.dart';

class HomePage extends StatefulWidget {
  int uid = 0;

  HomePage({super.key, required this.uid});

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  final TextEditingController _searchController = TextEditingController();
  String url = '';
  late Future<List<LottoGetRes>> loadData;
  late Future<Map<String, dynamic>> _userProfile;
  Future<List<LottoGetRes>>? _searchResults;

  @override
  void initState() {
    super.initState();
    log(widget.uid.toString()); // Log uid
    loadData = loadDataAsync();
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
                  return const Text(
                    'Loading...',
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 20,
                    ),
                  );
                } else if (snapshot.hasError) {
                  return const Text(
                    'Error',
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 20,
                    ),
                  );
                } else if (snapshot.hasData) {
                  final user = snapshot.data!;
                  return Text(
                    'Balance: ${user['balance'] ?? 'Unknown'} Baht',
                    style: const TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 20,
                    ),
                  );
                } else {
                  return const Text(
                    'No data',
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 20,
                    ),
                  );
                }
              },
            ),
          ),
          backgroundColor: const Color(0xFF453BC9),
          automaticallyImplyLeading: false,
        ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 52,
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xFF453BC9),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Center(
                  child: Text(
                    'Search for lucky numbers',
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                      fontSize: 24,
                      shadows: [
                        Shadow(
                          color: Colors.black.withOpacity(0.5),
                          offset: const Offset(0, 2),
                          blurRadius: 3,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Pinput(
                    controller: _searchController,
                    defaultPinTheme: PinTheme(
                      height: 40,
                      width: 40,
                      textStyle: const TextStyle(fontSize: 20, color: Colors.black),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 1.5),
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromARGB(255, 230, 230, 230), // Background color
                      ),
                    ),
                    length: 6, // Adjust based on your needs
                    showCursor: true,
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: _searchLotto,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF453BC9),
                      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
                      minimumSize: const Size.fromHeight(40),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: const Text(
                      'Search',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  FutureBuilder<List<LottoGetRes>>(
                    // future: loadData,
                    future: _searchResults,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      } else if (snapshot.hasData) {
                        var lottoList = snapshot.data!;
                        return SizedBox(
                          // กำหนดความสูงของ ListView
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: lottoList.length, // จำนวนของรายการ
                            itemBuilder: (context, index) {
                              var lotto = lottoList[index]; // ข้อมูลแต่ละรายการ
                              var numbersList = lotto.number
                                  .split(''); // ['1', '2', '3', '4', '5', '6']
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10.0),
                                child: SizedBox(
                                  height: 116, // กำหนดความสูงตามที่ต้องการ
                                  child: Stack(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                          border: Border.all(
                                            color: Colors.black, // สีของกรอบ
                                            width: 1.5, // ความกว้างของกรอบ
                                          ),
                                          color: const Color(
                                              0xFFFFFFFF), // สีพื้นหลัง
                                        ),
                                        child: Column(
                                          children: [
                                            // กรอบสีที่มุมซ้ายบน
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 0, top: 0),
                                              child: Align(
                                                alignment: Alignment.topLeft,
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.all(4.0),
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      4,
                                                  decoration: BoxDecoration(
                                                    color:
                                                        const Color(0xFF453BC9),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30.0),
                                                  ),
                                                  child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                        width: 20,
                                                        height: 20,
                                                        decoration:
                                                            const BoxDecoration(
                                                          color: Colors.white,
                                                          shape:
                                                              BoxShape.circle,
                                                        ),
                                                      ),
                                                      const SizedBox(width: 6),
                                                      const Text(
                                                        'lotto',
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 10, left: 5),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: List.generate(
                                                      numbersList.length, (i) {
                                                    return Padding(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          horizontal: 3.0),
                                                      child: Container(
                                                        height: 38,
                                                        width: 38,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          border: Border.all(
                                                            color: Colors.black,
                                                            width: 1.5,
                                                          ),
                                                        ),
                                                        child: Center(
                                                          child: Text(
                                                            '${numbersList[i]}', // ตัวเลขแต่ละตัว
                                                            style:
                                                                const TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
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
                                      // ข้อความ "50 Baht" ที่มุมบนขวา
                                      Positioned(
                                        bottom: 80,
                                        right: 10,
                                        child: Container(
                                          padding: const EdgeInsets.all(8.0),
                                          decoration: const BoxDecoration(
                                            color: Colors.transparent,
                                          ),
                                          child: Text(
                                            '${lotto.price} Baht', // ข้อมูลราคา
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                      // ปุ่ม "Buy"
                                        Positioned(
                                          bottom: 27,
                                          right: 10,
                                          child: ElevatedButton(
                                            onPressed: () {
                                              _showConfirmationDialog(lotto.lottery_id, lotto.number);
                                            },
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: const Color.fromARGB(255, 3, 209, 72),
                                              padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
                                              minimumSize: const Size(69, 30),
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(8.0),
                                              ),
                                            ),
                                            child: const Text(
                                              'Buy',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14,
                                              ),
                                            ),
                                          ),
                                        )
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      } else {
                        return const Center(child: Text('No data available'));
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
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
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProfilePage(
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
  Future<void> _buyLotto(int lotteryId) async {
    final url = 'https://nodejs-wfjd.onrender.com/lotto/userbuylotto';
    final response = await http.put(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'uid': widget.uid,
        'lottery_id': lotteryId,
      }),
    );

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      try {
        setState(() {
          _searchResults = loadDataAsync();
          _userProfile = fetchUserProfile(); 
        });
      } catch (e) {
        log('Error occurred: $e');
      }
    } else {
      try {
        final errorData = json.decode(response.body);
        final errorMessage = errorData['message'] ?? 'An unknown error occurred';

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to purchase lottery ticket: $errorMessage')),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error parsing error response: ${response.body}')),
        );
      }
    }
  }
  Future<List<LottoGetRes>> loadDataAsync() async {
    var value = await Configuration.getConfig();
    String url = value['apiEndPoint'];

    var response = await http.get(Uri.parse('https://nodejs-wfjd.onrender.com/lotto/'));
    if (response.statusCode == 200) {
      return lottoGetResFromJson(response.body);
    } else {
      throw Exception('Failed to load lotto data');
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
//   Future<void> _searchLotto() async {
//   final response = await http.post(
//     Uri.parse('https://nodejs-wfjd.onrender.com/lotto/searchlotto'),
//     headers: {'Content-Type': 'application/json'},
//     body: jsonEncode({'number_lotto': _searchController.text}),
//   );

//   if (response.statusCode == 200) {
//     try {
//       final List<dynamic> data = jsonDecode(response.body);
//       setState(() {
//         _searchResults = Future.value(data.map((item) => LottoGetRes.fromJson(item)).toList());
//       });
//     } catch (e) {
//       // Handle JSON parsing errors
//       setState(() {
//         _searchResults = Future.error('Unexpected response format.');
//       });
//     }
//   } else if (response.statusCode == 400) {
//     // Handle specific client-side error
//     setState(() {
//       _searchResults = Future.error('Bad request: ${response.body}');
//     });
//   } else {
//     // Handle other errors
//     setState(() {
//       _searchResults = Future.error('Error: ${response.statusCode} - ${response.body}');
//     });
//   }
// }
Future<void> _searchLotto() async {
  // Check if the search field is empty
  if (_searchController.text.isEmpty) {
    // If empty, fetch all lotto items with uid being null
    final response = await http.get(
      Uri.parse('https://nodejs-wfjd.onrender.com/lotto/'),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      try {
        final List<dynamic> data = jsonDecode(response.body);
        setState(() {
          _searchResults = Future.value(data.map((item) => LottoGetRes.fromJson(item)).toList());
        });
      } catch (e) {
        // Handle JSON parsing errors
        setState(() {
          _searchResults = Future.error('Unexpected response format.');
        });
      }
    } else if (response.statusCode == 400) {
      // Handle specific client-side error
      setState(() {
        _searchResults = Future.error('Bad request: ${response.body}');
      });
    } else {
      // Handle other errors
      setState(() {
        _searchResults = Future.error('Error: ${response.statusCode} - ${response.body}');
      });
    }
  } else {
    // Perform search with the entered number
    final response = await http.post(
      Uri.parse('https://nodejs-wfjd.onrender.com/lotto/searchlotto'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'number_lotto': _searchController.text}),
    );

    if (response.statusCode == 200) {
      try {
        final List<dynamic> data = jsonDecode(response.body);
        setState(() {
          _searchResults = Future.value(data.map((item) => LottoGetRes.fromJson(item)).toList());
        });
      } catch (e) {
        // Handle JSON parsing errors
        setState(() {
          _searchResults = Future.error('Unexpected response format.');
        });
      }
    } else if (response.statusCode == 400) {
      // Handle specific client-side error
      setState(() {
        _searchResults = Future.error('Bad request: ${response.body}');
      });
    } else {
      // Handle other errors
      setState(() {
        _searchResults = Future.error('Error: ${response.statusCode} - ${response.body}');
      });
    }
  }
}


  void _showConfirmationDialog(int lotteryId, String lotteryNumber) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text(
          'Confirm Purchase',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        content: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Do you want to buy the lottery ticket with number $lotteryNumber?',
            style: const TextStyle(
              fontSize: 16.0,
              color: Colors.black54,
            ),
          ),
        ),
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            child: const Text(
              'Cancel',
              style: TextStyle(
                color: Colors.red,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
              _buyLotto(lotteryId); // Proceed with the purchase and refresh the page
            },
            child: const Text(
              'Buy',
              style: TextStyle(
                color: Colors.green,
              ),
            ),
          ),
        ],
      );
    },
  );
}

}
