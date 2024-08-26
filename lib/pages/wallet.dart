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
            const SizedBox(height: 4.0),
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
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(20.0), 
          child: Container(
            color: const Color(0xFF453BC9), 
            padding:
                const EdgeInsets.symmetric(vertical: 0.0), 
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [

            Container(
              padding: const EdgeInsets.all(20.0),
              margin:
                  const EdgeInsets.only(bottom: 10.0),
              decoration: BoxDecoration(
                color: Color(0xFFD9D9D9), 
                borderRadius:
                    BorderRadius.circular(20), 
              ),
              height: 200,
              width: 350,
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start, 
                children: [
                  const Text(
                    'account balance: 5,146 Baht',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                  const SizedBox(
                      height: 10),
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
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white, 
                  borderRadius:
                      BorderRadius.circular(10), 
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5), 
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3), 
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
                          const Text(
                            'Transaction history', 
                            style: TextStyle(
                              color: Color(0xFF453BC9),
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              print('View all');
                            },
                            child: const Text(
                              'View all', 
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
                                10), 
                        itemCount: 5,
                        separatorBuilder: (context, index) => Divider(
                          color: Colors.grey[300], 
                          thickness: 1,
                        ),
                        itemBuilder: (context, index) {
                          return ListTile(
                            contentPadding: const EdgeInsets.all(16.0),
                            leading: ClipRRect(
                              borderRadius: BorderRadius.circular(
                                  8.0), 
                              child: Image.network(
                                'https://upload.wikimedia.org/wikipedia/th/2/29/%E0%B8%98%E0%B8%99%E0%B8%B2%E0%B8%84%E0%B8%B2%E0%B8%A3%E0%B8%81%E0%B8%A3%E0%B8%B8%E0%B8%87%E0%B9%84%E0%B8%97%E0%B8%A2.png', // URL ของรูปภาพที่คุณต้องการใช้
                                width: 50, 
                                height: 60, 
                                fit: BoxFit
                                    .cover, 
                                errorBuilder: (context, error, stackTrace) {
                                  return const Icon(
                                    Icons.error,
                                  );
                                },
                              ),
                            ),
                            title: const Text(
                              'Top up via bank account',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: const Text('August 8, 2024, 01:26 AM.'),
                            trailing: Text(
                              '\$${(index + 1) * 10}', // Example amount
                              style: const TextStyle(
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
