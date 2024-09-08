import 'package:flutter/material.dart';

class WalletPage extends StatelessWidget {
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
      body: Padding(
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
                  const Text(
                    'account balance: 5,146 Baht',
                    style: TextStyle(
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
                      width: 150,
                      height: 120,
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
            
            // ลิสต์ 4 กล่อง Lotto
            Expanded(
              child: ListView.builder(
                itemCount: 4, // จำนวนกล่องที่ต้องการ
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: LottoCard(), // สร้างกล่อง lotto แต่ละอัน
                  );
                },
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
            icon: Icon(Icons.wallet),
            label: 'Wallet',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: 'My Bag',
          ),
        ],
        selectedItemColor: Colors.blue, // สีของไอเท็มที่เลือก
        unselectedItemColor: Colors.grey, // สีของไอเท็มที่ไม่ถูกเลือก
      ),
    );
  }
}

class LottoCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 116,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              border: Border.all(
                color: Colors.black, // สีของกรอบ
                width: 1.5, // ความกว้างของกรอบ
              ),
              color: const Color(0xFFFFFFFF), // สีพื้นหลัง
            ),
            child: Column(
              children: [
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
                      children: List.generate(6, (i) { // วนลูป 6 กรอบ
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
                                '${i + 1}', // ตัวเลขจำลอง
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
              child: const Text(
                '50 Baht', // ข้อมูลราคา
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 27,
            right: 10,
            child: ElevatedButton(
              onPressed: () {
                print('Buy button pressed');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 51, 3, 192),
                padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
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
          )
        ],
      ),
    );
  }
}
