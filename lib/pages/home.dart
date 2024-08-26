import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:lotto_app/pages/profile.dart';
import 'package:lotto_app/pages/wallet.dart';

class HomePage extends StatefulWidget {
  final int uid; // Make uid final as it is required

  HomePage({super.key, required this.uid});

  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    log(widget.uid.toString()); // Log uid
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
        backgroundColor: const Color(0xFF453BC9),
        automaticallyImplyLeading: false,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    color: const Color(0xFF453BC9),
                    height: 92,
                    width: double.infinity,
                    child: const Padding(
                      padding: EdgeInsets.only(bottom: 60.0),
                      child: Center(
                        child: Text(
                          'Search for lucky numbers',
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                            fontSize: 24,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFD9D9D9),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    height: 600,
                    width: 380,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          TextField(
                            decoration: InputDecoration(
                              hintText: 'Search...',
                              suffixIcon: const Icon(Icons.search),
                              filled: true,
                              fillColor: Colors.white,
                              border: InputBorder.none,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50.0),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Lucky Number',
                              style: TextStyle(
                                fontWeight: FontWeight.w900,
                                color: const Color(0xFF453BC9),
                                fontSize: 20,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          SizedBox(
                            height: 145, // กำหนดความสูงตามที่ต้องการ
                            child: Container(
                              color: Color(0xFFFFFFFF),
                              width: double.infinity,
                              child: Column(
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 1.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: List.generate(6, (index) {
                                          return Container(
                                            height: 38, // ความสูงของวงรี
                                            width: 48, // ความกว้างของวงรี
                                            decoration: BoxDecoration(
                                              color: Color(
                                                  0xFF453BC9), // สีพื้นหลัง
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      20), // ทำให้มุมโค้งมน
                                            ),
                                            child: Center(
                                              child: Text(
                                                '${index + 1}', // แสดงตัวเลข
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16, // ขนาดตัวอักษร
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          );
                                        }),
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(width: 0),
                                      Image.network(
                                        'https://www.pngall.com/wp-content/uploads/4/Gold-Coin-PNG-High-Quality-Image.png', // URL ของรูปภาพ
                                        height: 80, // ขนาดความสูงของรูป
                                        width: 100, // ขนาดความกว้างของรูป
                                      ),
                                      SizedBox(width: 50),
                                      ElevatedButton(
                                        onPressed: () {
                                          print("Basket button pressed");
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Color.fromARGB(255,
                                              12, 250, 72), // Background color
                                          minimumSize: Size(80,
                                              36), // ขนาดปุ่ม (กว้าง 80, สูง 36)
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10,
                                              vertical:
                                                  8), // ลดพื้นที่รอบๆ ปุ่ม
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(40.0),
                                          ),
                                        ),
                                        child: const Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Icon(
                                              Icons.add,
                                              color: Colors.white,
                                              size: 20,
                                            ),
                                            SizedBox(width: 8),
                                            Text(
                                              'Basket',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(width: 8),
                                      ElevatedButton(
                                        onPressed: () {
                                          print("Buy button pressed");
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Color.fromARGB(255,
                                              12, 250, 72), // Background color
                                          minimumSize: Size(80,
                                              36), // ขนาดปุ่ม (กว้าง 80, สูง 36)
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10,
                                              vertical:
                                                  8), // ลดพื้นที่รอบๆ ปุ่ม
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(40.0),
                                          ),
                                        ),
                                        child: const Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Icon(
                                              Icons.add,
                                              color: Colors.white,
                                              size: 20,
                                            ),
                                            SizedBox(width: 8),
                                            Text(
                                              'Buy',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          SizedBox(
                            height: 145, // กำหนดความสูงตามที่ต้องการ
                            child: Container(
                              color: Color(0xFFFFFFFF),
                              width: double.infinity,
                              child: Column(
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 1.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: List.generate(6, (index) {
                                          return Container(
                                            height: 38, // ความสูงของวงรี
                                            width: 48, // ความกว้างของวงรี
                                            decoration: BoxDecoration(
                                              color: Color(
                                                  0xFF453BC9), // สีพื้นหลัง
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      20), // ทำให้มุมโค้งมน
                                            ),
                                            child: Center(
                                              child: Text(
                                                '${index + 1}', // แสดงตัวเลข
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16, // ขนาดตัวอักษร
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          );
                                        }),
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(width: 0),
                                      Image.network(
                                        'https://www.pngall.com/wp-content/uploads/4/Gold-Coin-PNG-High-Quality-Image.png', // URL ของรูปภาพ
                                        height: 80, // ขนาดความสูงของรูป
                                        width: 100, // ขนาดความกว้างของรูป
                                      ),
                                      SizedBox(width: 50),
                                      ElevatedButton(
                                        onPressed: () {
                                          print("Basket button pressed");
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Color.fromARGB(255,
                                              12, 250, 72), // Background color
                                          minimumSize: Size(80,
                                              36), // ขนาดปุ่ม (กว้าง 80, สูง 36)
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10,
                                              vertical:
                                                  8), // ลดพื้นที่รอบๆ ปุ่ม
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(40.0),
                                          ),
                                        ),
                                        child: const Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Icon(
                                              Icons.add,
                                              color: Colors.white,
                                              size: 20,
                                            ),
                                            SizedBox(width: 8),
                                            Text(
                                              'Basket',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(width: 8),
                                      ElevatedButton(
                                        onPressed: () {
                                          print("Buy button pressed");
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Color.fromARGB(255,
                                              12, 250, 72), // Background color
                                          minimumSize: Size(80,
                                              36), // ขนาดปุ่ม (กว้าง 80, สูง 36)
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10,
                                              vertical:
                                                  8), // ลดพื้นที่รอบๆ ปุ่ม
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(40.0),
                                          ),
                                        ),
                                        child: const Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Icon(
                                              Icons.add,
                                              color: Colors.white,
                                              size: 20,
                                            ),
                                            SizedBox(width: 8),
                                            Text(
                                              'Buy',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          SizedBox(
                            height: 145, // กำหนดความสูงตามที่ต้องการ
                            child: Container(
                              color: Color(0xFFFFFFFF),
                              width: double.infinity,
                              child: Column(
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 1.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: List.generate(6, (index) {
                                          return Container(
                                            height: 38, // ความสูงของวงรี
                                            width: 48, // ความกว้างของวงรี
                                            decoration: BoxDecoration(
                                              color: Color(
                                                  0xFF453BC9), // สีพื้นหลัง
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      20), // ทำให้มุมโค้งมน
                                            ),
                                            child: Center(
                                              child: Text(
                                                '${index + 1}', // แสดงตัวเลข
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16, // ขนาดตัวอักษร
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          );
                                        }),
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(width: 0),
                                      Image.network(
                                        'https://www.pngall.com/wp-content/uploads/4/Gold-Coin-PNG-High-Quality-Image.png', // URL ของรูปภาพ
                                        height: 80, // ขนาดความสูงของรูป
                                        width: 100, // ขนาดความกว้างของรูป
                                      ),
                                      SizedBox(width: 50),
                                      ElevatedButton(
                                        onPressed: () {
                                          print("Basket button pressed");
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Color.fromARGB(255,
                                              12, 250, 72), // Background color
                                          minimumSize: Size(80,
                                              36), // ขนาดปุ่ม (กว้าง 80, สูง 36)
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10,
                                              vertical:
                                                  8), // ลดพื้นที่รอบๆ ปุ่ม
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(40.0),
                                          ),
                                        ),
                                        child: const Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Icon(
                                              Icons.add,
                                              color: Colors.white,
                                              size: 20,
                                            ),
                                            SizedBox(width: 8),
                                            Text(
                                              'Basket',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(width: 8),
                                      ElevatedButton(
                                        onPressed: () {
                                          print("Buy button pressed");
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Color.fromARGB(255,
                                              12, 250, 72), // Background color
                                          minimumSize: Size(80,
                                              36), // ขนาดปุ่ม (กว้าง 80, สูง 36)
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10,
                                              vertical:
                                                  8), // ลดพื้นที่รอบๆ ปุ่ม
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(40.0),
                                          ),
                                        ),
                                        child: const Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Icon(
                                              Icons.add,
                                              color: Colors.white,
                                              size: 20,
                                            ),
                                            SizedBox(width: 8),
                                            Text(
                                              'Buy',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.wallet),
            label: 'Wallet',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        selectedItemColor: Color(0xFF453BC9),
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        onTap: (int index) {
          if (index == 2) {
            // "Profile" icon is at index 2
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProfilePage(
                  uid: widget.uid, // Pass uid from HomePage
                ),
              ),
            );
          } else if (index == 1) {
            // "Wallet" icon is at index 1
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => WalletPage()),
            );
          } else {
            // Handle other tabs
            print("Selected tab: $index");
          }
        },
      ),
    );
  }
}
