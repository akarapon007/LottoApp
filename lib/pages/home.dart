import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:lotto_app/config/config.dart';
import 'package:lotto_app/pages/profile.dart';
import 'package:lotto_app/pages/wallet.dart';
import 'package:lotto_app/pages/updatemoney.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  int uid = 0;

  HomePage({super.key, required this.uid});

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  String url = '';

  late Future<void> loadData;
  @override
  void initState() {
    super.initState();
    log(widget.uid.toString()); // Log uid
    loadData = loadDataAstnc();
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
                    height: 52,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color(0xFF453BC9),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3), // สีของเงา
                          spreadRadius: 2, // ขยายขนาดของเงา
                          blurRadius: 5, // ขนาดความเบลอของเงา
                          offset: const Offset(0, 4), // ตำแหน่งของเงา
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
                                color: Colors.black
                                    .withOpacity(0.5), // สีของเงาของข้อความ
                                offset: const Offset(
                                    0, 2), // ตำแหน่งของเงาของข้อความ
                                blurRadius: 3, // ขนาดความเบลอของเงาของข้อความ
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                  Container(
                    decoration: BoxDecoration(
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
                              fillColor: const Color.fromARGB(255, 230, 230, 230),
                              
                              border: InputBorder.none,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50.0),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Lucky Number',
                              style: TextStyle(
                                fontWeight: FontWeight.w900,
                                color: Color(0xFF453BC9),
                                fontSize: 20,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          SizedBox(
                            height: 145, // กำหนดความสูงตามที่ต้องการ
                            child: Stack(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.0),
                                    border: Border.all(
                                      color: Colors.black, // สีของกรอบ
                                      width: 1.5, // ความกว้างของกรอบ
                                    ),
                                    color: const Color(
                                        0xFFFFFFFF), // สีพื้นหลังของ Container
                                  ),
                                  child: Column(
                                    children: [
                                      // กรอบสีที่มุมซ้ายบน
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 0,
                                            top:
                                                0), // ขยับตำแหน่งให้ชิดขอบบนซ้าย
                                        child: Align(
                                            alignment: Alignment
                                                .topLeft, // จัดตำแหน่งกรอบไปที่มุมซ้ายบน
                                            child: Container(
                                              padding: const EdgeInsets.all(
                                                  4.0), // ลด padding ให้ข้อความและวงกลม
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  4, // ตั้งความกว้างให้หนึ่งในสี่ของหน้าจอ
                                              decoration: BoxDecoration(
                                                color: const Color(
                                                    0xFF453BC9), // สีพื้นหลังของกรอบ
                                                borderRadius: BorderRadius.circular(
                                                    30.0), // ปรับความโค้งของกรอบให้เล็กลง
                                              ),
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  // วงกลมสีขาวด้านซ้าย
                                                  Container(
                                                    width:
                                                        20, // ขนาดของวงกลมลดลง
                                                    height:
                                                        20, // ขนาดของวงกลมลดลง
                                                    decoration:
                                                        const BoxDecoration(
                                                      color: Colors
                                                          .white, // สีของวงกลม
                                                      shape: BoxShape
                                                          .circle, // รูปทรงวงกลม
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                      width:
                                                          6), // ช่องว่างระหว่างวงกลมกับข้อความลดลง
                                                  // ข้อความ lotto
                                                  const Text(
                                                    'lotto', // ข้อความ
                                                    style: TextStyle(
                                                      color: Colors
                                                          .white, // สีของข้อความ
                                                      fontSize:
                                                          14, // ขนาดตัวอักษรลดลง
                                                      fontWeight: FontWeight
                                                          .w500, // น้ำหนักตัวอักษรลดลง
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 25, left: 5),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment
                                                .start, // จัดเรียงให้เริ่มจากด้านซ้าย
                                            children: List.generate(6, (index) {
                                              return Padding(
                                                padding: const EdgeInsets
                                                    .symmetric(
                                                    horizontal:
                                                        3.0), // กำหนดช่องว่างระหว่างแต่ละ Container
                                                child: Container(
                                                  height: 38, // ความสูงของวงรี
                                                  width: 38, // ความกว้างของวงรี
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10), // ทำให้มุมโค้งมน
                                                    border: Border.all(
                                                      color: Colors
                                                          .black, // สีของกรอบ
                                                      width:
                                                          1.5, // ความกว้างของกรอบ
                                                    ),
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      '${index + 1}', // แสดงตัวเลข
                                                      style: const TextStyle(
                                                        color: Color.fromARGB(
                                                            255, 0, 0, 0),
                                                        fontSize:
                                                            16, // ขนาดตัวอักษร
                                                        fontWeight:
                                                            FontWeight.bold,
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
                                  top: 10, // ขยับขึ้นจากขอบบน
                                  right: 10,
                                  child: Container(
                                    padding: const EdgeInsets.all(8.0),
                                    decoration: const BoxDecoration(
                                      color:
                                          Colors.transparent, // พื้นหลังโปร่งใส
                                    ),
                                    child: const Text(
                                      '50 Baht', // ข้อความ
                                      style: TextStyle(
                                        color: Colors.black, // สีของข้อความ
                                        fontSize: 16, // ขนาดตัวอักษร
                                        fontWeight:
                                            FontWeight.bold, // น้ำหนักตัวอักษร
                                      ),
                                    ),
                                  ),
                                ),
                                // ปุ่ม "Buy"
                                Positioned(
                                  bottom: 42, // ขยับขึ้นจากขอบล่างให้ใกล้ขึ้น
                                  right: 10,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      // เพิ่มฟังก์ชันเมื่อกดปุ่ม "Buy"
                                      print('Buy button pressed');
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color.fromARGB(
                                          255, 3, 209, 72), // สีพื้นหลัง
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 12.0,
                                          vertical: 6.0), // กำหนดขนาด padding
                                      minimumSize: const Size(
                                          49, 30), // กำหนดขนาดขั้นต่ำของปุ่ม
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            8.0), // ความโค้งของมุม
                                      ),
                                    ),
                                    child: const Text(
                                      'Buy',
                                      style: TextStyle(
                                        color: Colors.white, // สีของข้อความ
                                        fontSize: 14, // ขนาดตัวอักษรเล็กลง
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          SizedBox(
                            height: 145, // กำหนดความสูงตามที่ต้องการ
                            child: Stack(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.0),
                                    border: Border.all(
                                      color: Colors.black, // สีของกรอบ
                                      width: 1.5, // ความกว้างของกรอบ
                                    ),
                                    color: const Color(
                                        0xFFFFFFFF), // สีพื้นหลังของ Container
                                  ),
                                  child: Column(
                                    children: [
                                      // กรอบสีที่มุมซ้ายบน
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 0,
                                            top:
                                                0), // ขยับตำแหน่งให้ชิดขอบบนซ้าย
                                        child: Align(
                                            alignment: Alignment
                                                .topLeft, // จัดตำแหน่งกรอบไปที่มุมซ้ายบน
                                            child: Container(
                                              padding: const EdgeInsets.all(
                                                  4.0), // ลด padding ให้ข้อความและวงกลม
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  4, // ตั้งความกว้างให้หนึ่งในสี่ของหน้าจอ
                                              decoration: BoxDecoration(
                                                color: const Color(
                                                    0xFF453BC9), // สีพื้นหลังของกรอบ
                                                borderRadius: BorderRadius.circular(
                                                    30.0), // ปรับความโค้งของกรอบให้เล็กลง
                                              ),
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  // วงกลมสีขาวด้านซ้าย
                                                  Container(
                                                    width:
                                                        20, // ขนาดของวงกลมลดลง
                                                    height:
                                                        20, // ขนาดของวงกลมลดลง
                                                    decoration:
                                                        const BoxDecoration(
                                                      color: Colors
                                                          .white, // สีของวงกลม
                                                      shape: BoxShape
                                                          .circle, // รูปทรงวงกลม
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                      width:
                                                          6), // ช่องว่างระหว่างวงกลมกับข้อความลดลง
                                                  // ข้อความ lotto
                                                  const Text(
                                                    'lotto', // ข้อความ
                                                    style: TextStyle(
                                                      color: Colors
                                                          .white, // สีของข้อความ
                                                      fontSize:
                                                          14, // ขนาดตัวอักษรลดลง
                                                      fontWeight: FontWeight
                                                          .w500, // น้ำหนักตัวอักษรลดลง
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 25, left: 5),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment
                                                .start, // จัดเรียงให้เริ่มจากด้านซ้าย
                                            children: List.generate(6, (index) {
                                              return Padding(
                                                padding: const EdgeInsets
                                                    .symmetric(
                                                    horizontal:
                                                        3.0), // กำหนดช่องว่างระหว่างแต่ละ Container
                                                child: Container(
                                                  height: 38, // ความสูงของวงรี
                                                  width: 38, // ความกว้างของวงรี
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10), // ทำให้มุมโค้งมน
                                                    border: Border.all(
                                                      color: Colors
                                                          .black, // สีของกรอบ
                                                      width:
                                                          1.5, // ความกว้างของกรอบ
                                                    ),
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      '${index + 1}', // แสดงตัวเลข
                                                      style: const TextStyle(
                                                        color: Color.fromARGB(
                                                            255, 0, 0, 0),
                                                        fontSize:
                                                            16, // ขนาดตัวอักษร
                                                        fontWeight:
                                                            FontWeight.bold,
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
                                  top: 10, // ขยับขึ้นจากขอบบน
                                  right: 10,
                                  child: Container(
                                    padding: const EdgeInsets.all(8.0),
                                    decoration: const BoxDecoration(
                                      color:
                                          Colors.transparent, // พื้นหลังโปร่งใส
                                    ),
                                    child: const Text(
                                      '50 Baht', // ข้อความ
                                      style: TextStyle(
                                        color: Colors.black, // สีของข้อความ
                                        fontSize: 16, // ขนาดตัวอักษร
                                        fontWeight:
                                            FontWeight.bold, // น้ำหนักตัวอักษร
                                      ),
                                    ),
                                  ),
                                ),
                                // ปุ่ม "Buy"
                                Positioned(
                                  bottom: 42, // ขยับขึ้นจากขอบล่างให้ใกล้ขึ้น
                                  right: 10,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      // เพิ่มฟังก์ชันเมื่อกดปุ่ม "Buy"
                                      print('Buy button pressed');
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color.fromARGB(
                                          255, 3, 209, 72), // สีพื้นหลัง
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 12.0,
                                          vertical: 6.0), // กำหนดขนาด padding
                                      minimumSize: const Size(
                                          49, 30), // กำหนดขนาดขั้นต่ำของปุ่ม
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            8.0), // ความโค้งของมุม
                                      ),
                                    ),
                                    child: const Text(
                                      'Buy',
                                      style: TextStyle(
                                        color: Colors.white, // สีของข้อความ
                                        fontSize: 14, // ขนาดตัวอักษรเล็กลง
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          SizedBox(
                            height: 145, // กำหนดความสูงตามที่ต้องการ
                            child: Stack(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.0),
                                    border: Border.all(
                                      color: Colors.black, // สีของกรอบ
                                      width: 1.5, // ความกว้างของกรอบ
                                    ),
                                    color: const Color.fromARGB(255, 255, 255,
                                        255), // สีพื้นหลังของ Container
                                  ),
                                  child: Column(
                                    children: [
                                      // กรอบสีที่มุมซ้ายบน
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 0,
                                            top:
                                                0), // ขยับตำแหน่งให้ชิดขอบบนซ้าย
                                        child: Align(
                                            alignment: Alignment
                                                .topLeft, // จัดตำแหน่งกรอบไปที่มุมซ้ายบน
                                            child: Container(
                                              padding: const EdgeInsets.all(
                                                  4.0), // ลด padding ให้ข้อความและวงกลม
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  4, // ตั้งความกว้างให้หนึ่งในสี่ของหน้าจอ
                                              decoration: BoxDecoration(
                                                color: const Color(
                                                    0xFF453BC9), // สีพื้นหลังของกรอบ
                                                borderRadius: BorderRadius.circular(
                                                    30.0), // ปรับความโค้งของกรอบให้เล็กลง
                                              ),
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  // วงกลมสีขาวด้านซ้าย
                                                  Container(
                                                    width:
                                                        20, // ขนาดของวงกลมลดลง
                                                    height:
                                                        20, // ขนาดของวงกลมลดลง
                                                    decoration:
                                                        const BoxDecoration(
                                                      color: Colors
                                                          .white, // สีของวงกลม
                                                      shape: BoxShape
                                                          .circle, // รูปทรงวงกลม
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                      width:
                                                          6), // ช่องว่างระหว่างวงกลมกับข้อความลดลง
                                                  // ข้อความ lotto
                                                  const Text(
                                                    'lotto', // ข้อความ
                                                    style: TextStyle(
                                                      color: Colors
                                                          .white, // สีของข้อความ
                                                      fontSize:
                                                          14, // ขนาดตัวอักษรลดลง
                                                      fontWeight: FontWeight
                                                          .w500, // น้ำหนักตัวอักษรลดลง
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 25, left: 5),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment
                                                .start, // จัดเรียงให้เริ่มจากด้านซ้าย
                                            children: List.generate(6, (index) {
                                              return Padding(
                                                padding: const EdgeInsets
                                                    .symmetric(
                                                    horizontal:
                                                        3.0), // กำหนดช่องว่างระหว่างแต่ละ Container
                                                child: Container(
                                                  height: 38, // ความสูงของวงรี
                                                  width: 38, // ความกว้างของวงรี
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10), // ทำให้มุมโค้งมน
                                                    border: Border.all(
                                                      color: Colors
                                                          .black, // สีของกรอบ
                                                      width:
                                                          1.5, // ความกว้างของกรอบ
                                                    ),
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      '${index + 1}', // แสดงตัวเลข
                                                      style: const TextStyle(
                                                        color: Color.fromARGB(
                                                            255, 0, 0, 0),
                                                        fontSize:
                                                            16, // ขนาดตัวอักษร
                                                        fontWeight:
                                                            FontWeight.bold,
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
                                  top: 10, // ขยับขึ้นจากขอบบน
                                  right: 10,
                                  child: Container(
                                    padding: const EdgeInsets.all(8.0),
                                    decoration: const BoxDecoration(
                                      color:
                                          Colors.transparent, // พื้นหลังโปร่งใส
                                    ),
                                    child: const Text(
                                      '50 Baht', // ข้อความ
                                      style: TextStyle(
                                        color: Colors.black, // สีของข้อความ
                                        fontSize: 16, // ขนาดตัวอักษร
                                        fontWeight:
                                            FontWeight.bold, // น้ำหนักตัวอักษร
                                      ),
                                    ),
                                  ),
                                ),
                                // ปุ่ม "Buy"
                                Positioned(
                                  bottom: 42, // ขยับขึ้นจากขอบล่างให้ใกล้ขึ้น
                                  right: 10,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      // เพิ่มฟังก์ชันเมื่อกดปุ่ม "Buy"
                                      print('Buy button pressed');
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color.fromARGB(
                                          255, 3, 209, 72), // สีพื้นหลัง
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 12.0,
                                          vertical: 6.0), // กำหนดขนาด padding
                                      minimumSize: const Size(
                                          49, 30), // กำหนดขนาดขั้นต่ำของปุ่ม
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            8.0), // ความโค้งของมุม
                                      ),
                                    ),
                                    child: const Text(
                                      'Buy',
                                      style: TextStyle(
                                        color: Colors.white, // สีของข้อความ
                                        fontSize: 14, // ขนาดตัวอักษรเล็กลง
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10), // Space between buttons

                  // Sign Up button
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor:  const Color(
                                                    0xFF453BC9),
                      fixedSize: Size(250, 50), // Set button width and height
                    ),
                    child: const Text(
                      'Purchase',
                      style: TextStyle(
                        fontWeight:
                            FontWeight.w800, // Set font weight to extra bold
                        fontSize: 24, // Set the font size
                        color: Colors.white,
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
        selectedItemColor: const Color(0xFF453BC9),
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        onTap: (int index) {
          if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProfilePage(
                  uid: widget.uid,
                ),
              ),
            );
          } else if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => WalletPage()),
            );
          } else {
            print("Selected tab: $index");
          }
        },
      ),
    );
  }

  Future<void> loadDataAstnc() async {
    var value = await Configuration.getConfig();
    String url = value['apiEndPoint'];

    var json = await http.get(Uri.parse('$url/lotto'));
    // tripGetResponses = tripsGetResFromJson(json.body);
  }

  // void getTrips(String? zone) async {
  //   // 1. Create http
  //   var value = await Configuration.getConfig();
  //   String url = value['apiEndPoint'];
  //   http.get(Uri.parse('$url/trips')).then(
  //     (value) {
  //       tripGetResponses = tripsGetResFromJson(value.body);
  //       List<TripsGetRes> filltertrips = [];
  //       if (zone != null) {
  //         for (var trip in tripGetResponses) {
  //           if (trip.destinationZone == zone) {
  //             filltertrips.add(trip);
  //           }
  //         }
  //         tripGetResponses = filltertrips;
  //       }
  //       setState(() {});
  //     },
  //   );
  // }
}
