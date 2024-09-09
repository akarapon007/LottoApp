import 'package:flutter/material.dart';
import 'package:lotto_app/config/config.dart';
import 'package:http/http.dart' as http;
import 'package:lotto_app/models/response/lottoGetRes.dart';
import 'package:lotto_app/models/response/user_idx_res.dart';

class Mylotto extends StatefulWidget {
  int uid = 0;
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
        backgroundColor: const Color(0xFF453BC9),
        title: const Text(
          'My Lotto',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        toolbarHeight: 120.0,
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
    );
  }

  Widget buildLottoList() {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
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
                                  'lotto',
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
                // "Price" text at the top right
                Positioned(
                  bottom: 80,
                  right: 10,
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: const BoxDecoration(
                      color: Colors.transparent,
                    ),
                    child: Text(
                      '${lotto.price} Baht', // Price information
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                // "Check" button
                Positioned(
                  bottom: 28,
                  right: 10,
                  child: ElevatedButton(
                    onPressed: () async {
                      // เรียก API เพื่อตรวจสอบผลลอตเตอรี่ที่นี่
                      var response = await http.get(Uri.parse(
                          'API_URL_FOR_CHECK_LOTTO/${lotto.lottery_id}'));
                      if (response.statusCode == 200) {
                        // ประมวลผลข้อมูลที่ได้รับและแสดงผลลัพธ์ให้ผู้ใช้
                        print(
                            'Lotto checked successfully for ID: ${lotto.lottery_id}');
                      } else {
                        // แสดงข้อผิดพลาด
                        print(
                            'Failed to check lotto for ID: ${lotto.lottery_id}');
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
      var config = await Configuration.getConfig();
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
}
