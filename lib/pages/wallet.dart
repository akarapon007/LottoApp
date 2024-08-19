import 'package:flutter/material.dart';

class WalletPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
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
            const SizedBox(height: 4.0), // เว้นระยะห่างระหว่างข้อความ
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
        toolbarHeight: 70.0, // เพิ่มความสูงของ AppBar
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(20.0), // ความสูงของพื้นที่ด้านล่าง
          child: Container(
            color: const Color(0xFF453BC9), // สีพื้นหลังของ bottom
            padding:
                const EdgeInsets.symmetric(vertical: 0.0), // ลดระยะห่างด้านบน
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Header
            Container(
              padding: const EdgeInsets.all(20.0), // เพิ่มการเว้นระยะห่างภายใน
              margin:
                  const EdgeInsets.only(bottom: 10.0), // เพิ่มระยะห่างด้านล่าง
              decoration: BoxDecoration(
                color: Color(0xFFD9D9D9), // เปลี่ยนสีพื้นหลังเป็น #D9D9D9
                borderRadius:
                    BorderRadius.circular(20), // ตั้งค่ามุมโค้งเป็น 20 พิกเซล
              ),
              height: 200,
              width: 350,
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start, // ข้อความและรูปภาพอยู่ที่มุมซ้าย
                children: [
                  Text(
                    'account balance: 5,146 Baht',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                  const SizedBox(
                      height: 10), // เว้นระยะห่างระหว่างข้อความและรูปภาพ
                  Align(
                    alignment: Alignment.centerRight, // ขยับรูปภาพไปทางขวา
                    child: Image.network(
                      'https://static.vecteezy.com/system/resources/thumbnails/019/051/628/small_2x/gold-coin-money-symbol-icon-png.png', // ใส่ URL ของรูปภาพที่คุณต้องการใช้
                      width: 150, // กำหนดความกว้างของรูปภาพ
                      height: 120, // กำหนดความสูงของรูปภาพ
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(
                          Icons.error,
                        ); // แสดงไอคอนเมื่อโหลดรูปภาพไม่สำเร็จ
                      },
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Wallet Items
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white, // เปลี่ยนสีพื้นหลังตามต้องการ
                  borderRadius:
                      BorderRadius.circular(10), // มุมโค้งของ Container
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5), // สีเงา
                      spreadRadius: 2, // การกระจายของเงา
                      blurRadius: 5, // ความเบลอของเงา
                      offset: Offset(0, 3), // การเคลื่อนที่ของเงา
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Transaction history', // ข้อความที่มุมซ้าย
                            style: TextStyle(
                              color: Color(0xFF453BC9),
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              // Handle button press
                              print('View all');
                            },
                            child: Text(
                              'View all', // ข้อความที่มุมขวา
                              style: TextStyle(
                                color: Color(0xFF453BC9),
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: ListView.separated(
                        padding: const EdgeInsets.only(
                            top:
                                10), // เพิ่มพื้นที่ด้านบนเพื่อให้ข้อความไม่ทับกับ ListView
                        itemCount: 5,
                        separatorBuilder: (context, index) => Divider(
                          color: Colors.grey[300], // สีของเส้นแบ่ง
                          thickness: 1, // ความหนาของเส้นแบ่ง
                        ),
                        itemBuilder: (context, index) {
                          return ListTile(
                            contentPadding: const EdgeInsets.all(16.0),
                            leading: ClipRRect(
                              borderRadius: BorderRadius.circular(
                                  8.0), // กำหนดขนาดของมุมโค้ง
                              child: Image.network(
                                'https://upload.wikimedia.org/wikipedia/th/2/29/%E0%B8%98%E0%B8%99%E0%B8%B2%E0%B8%84%E0%B8%B2%E0%B8%A3%E0%B8%81%E0%B8%A3%E0%B8%B8%E0%B8%87%E0%B9%84%E0%B8%97%E0%B8%A2.png', // URL ของรูปภาพที่คุณต้องการใช้
                                width: 50, // กำหนดความกว้างของรูปภาพ
                                height: 60, // กำหนดความสูงของรูปภาพ
                                fit: BoxFit
                                    .cover, // ปรับขนาดของรูปภาพให้พอดีกับขนาดที่กำหนด
                                errorBuilder: (context, error, stackTrace) {
                                  return const Icon(
                                    Icons.error,
                                  ); // แสดงไอคอนเมื่อโหลดรูปภาพไม่สำเร็จ
                                },
                              ),
                            ),
                            title: Text(
                              'Top up via bank account',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text('August 8, 2024, 01:26 AM.'),
                            trailing: Text(
                              '\$${(index + 1) * 10}', // Example amount
                              style: TextStyle(
                                fontSize: 18,
                                color: Color(0xFF453BC9),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
