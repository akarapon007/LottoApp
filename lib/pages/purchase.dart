import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:lotto_app/config/config.dart';
import 'package:lotto_app/pages/profile.dart';
import 'package:lotto_app/pages/wallet.dart';
import 'package:http/http.dart' as http;

class Purchase extends StatefulWidget {
  int uid = 0;

  Purchase({super.key, required this.uid});

  @override
  State<Purchase> createState() => _Purchase();
}

class _Purchase extends State<Purchase> {
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                buildTitleContainer(),
                buildLottoList(),
                const SizedBox(height: 10), // Space between buttons
              ],
            ),
          ),
          Positioned(
            bottom: 50,
            left: 0,
            right: 0,
            child: Center(
              child: ElevatedButton(
                    onPressed: () {
                  // Add your purchase action here
                  print('Purchase button pressed');
                },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF453BC9), // สีของปุ่ม
                      padding: const EdgeInsets.symmetric(
                        horizontal: 50.0,
                        vertical: 9.0,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(45.0), // มุมโค้งของปุ่ม
                      ),
                    ),
                    child: const Text(
                      'Check Lottory',
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  Widget buildTitleContainer() {
    return Container(
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
            'My Lottery',
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
    );
  }

  Widget buildLottoList() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SizedBox(
        height: 650,
        child: ListView.builder(
          itemCount: 4,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: buildLottoCard(),
            );
          },
        ),
      ),
    );
  }

  Widget buildLottoCard() {
    return SizedBox(
      height: 116,
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
                buildLottoLabel(),
                buildLottoNumbers(),
              ],
            ),
          ),
          buildPriceLabel(),
          buildBuyButton(),
        ],
      ),
    );
  }

  Widget buildLottoLabel() {
    return Padding(
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
    );
  }

  Widget buildLottoNumbers() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10, left: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: List.generate(6, (i) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3.0),
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
                    '${i + 1}',
                    style: const TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
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
    );
  }

  Widget buildPriceLabel() {
    return Positioned(
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
    );
  }

  Widget buildBuyButton() {
    return Positioned(
      bottom: 27,
      right: 10,
      child: ElevatedButton(
        onPressed: () {
          print('Buy button pressed');
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
    );
  }

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
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
        handleBottomNavigationTap(index);
      },
    );
  }

  void handleBottomNavigationTap(int index) {
    switch (index) {
      case 0:
        print("Selected Home tab");
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => WalletPage()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProfilePage(uid: widget.uid),
          ),
        );
        break;
    }
  }

  Future<void> loadDataAsync() async {
    try {
      var value = await Configuration.getConfig();
      url = value['apiEndPoint'];
      var response = await http.get(Uri.parse('$url/lotto'));
      // Process your response here
    } catch (e) {
      print('Error loading data: $e');
    }
  }
}
