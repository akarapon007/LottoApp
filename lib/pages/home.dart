import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:lotto_app/config/config.dart';
import 'package:lotto_app/models/response/lottoGetRes.dart';
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
    loadData = loadDataAsync();
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
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          TextField(
                            decoration: InputDecoration(
                              hintText: 'Search...',
                              suffixIcon: const Icon(Icons.search),
                              filled: true,
                              fillColor:
                                  const Color.fromARGB(255, 230, 230, 230),
                              border: InputBorder.none,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50.0),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Lucky Number',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    color: Color(0xFF453BC9),
                                    fontSize: 20,
                                  ),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.refresh,
                                      color: Color(0xFF453BC9)),
                                  onPressed: () {
                                    // โค้ดที่เรียกใช้เมื่อกดปุ่มรีเฟรช
                                    print('Refresh button pressed');
                                  },
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 650, // กำหนดความสูงของ ListView
                            child: ListView.builder(
                              itemCount: 4, // จำนวนของ SizedBox ที่ต้องการแสดง
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical:
                                          10.0), // กำหนด padding ระหว่างแต่ละ SizedBox
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
                                                0xFFFFFFFF), // สีพื้นหลังของ Container
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
                                                        const EdgeInsets.all(
                                                            4.0),
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            4,
                                                    decoration: BoxDecoration(
                                                      color: const Color(
                                                          0xFF453BC9),
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
                                                        const SizedBox(
                                                            width: 6),
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
                                                  padding:
                                                      const EdgeInsets.only(
                                                          bottom: 10, left: 5),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children:
                                                        List.generate(6, (i) {
                                                      return Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                                horizontal:
                                                                    3.0),
                                                        child: Container(
                                                          height: 38,
                                                          width: 38,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                            border: Border.all(
                                                              color:
                                                                  Colors.black,
                                                              width: 1.5,
                                                            ),
                                                          ),
                                                          child: Center(
                                                            child: Text(
                                                              '${i + 1}',
                                                              style:
                                                                  const TextStyle(
                                                                color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        0,
                                                                        0,
                                                                        0),
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
                                            child: const Text(
                                              '50 Baht',
                                              style: TextStyle(
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
                                              print('Buy button pressed');
                                            },
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  const Color.fromARGB(
                                                      255, 3, 209, 72),
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 12.0,
                                                      vertical: 6.0),
                                              minimumSize: const Size(69, 30),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
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
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10), // Space between buttons
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

  Future<List<LottoGetRes>> loadDataAsync() async {
    var value = await Configuration.getConfig();
    String url = value['apiEndPoint'];

    var response = await http.get(Uri.parse('$url/lotto'));
    if (response.statusCode == 200) {
      return lottoGetResFromJson(response.body);
    } else {
      throw Exception('Failed to load lotto data');
    }
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
