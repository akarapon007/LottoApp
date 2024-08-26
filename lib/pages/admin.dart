import 'package:flutter/material.dart';
import 'dart:math';

class Adminpage extends StatefulWidget {
  @override
  _AdminpageState createState() => _AdminpageState();
}

class _AdminpageState extends State<Adminpage> {
  List<int> randomNumbers = List.generate(6, (index) => index + 1);

  void generateRandomNumbers() {
    setState(() {
      randomNumbers = List.generate(6, (_) => Random().nextInt(10));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
        backgroundColor: const Color(0xFF453BC9),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: const Color(0xFF453BC9),
              width: double.infinity,
              child: Column(
                children: [
                  Container(
                    height: 25,
                    width: double.infinity,
                    child: const Center(
                      child: Text(
                        'สุ่มรางวัล Number',
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(6, (index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Container(
                                width: 40,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  '${randomNumbers[index]}',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                        SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: ElevatedButton(
                            onPressed: generateRandomNumbers,
                            child: Text(
                              'Random',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: Color.fromARGB(255, 153, 153, 153),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 15),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 520,
              width: 380,
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 243, 241, 241),
                  borderRadius: BorderRadius.circular(10),
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
                    Expanded(
                      child: ListView.separated(
                        padding: const EdgeInsets.only(top: 10),
                        itemCount: 5,
                        separatorBuilder: (context, index) => Divider(
                          color: Colors.grey[300],
                          thickness: 1,
                        ),
                        itemBuilder: (context, index) {
                          return ListTile(
                            contentPadding: const EdgeInsets.all(16.0),
                            leading: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'รางวัลที่ ${index + 1}',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Color.fromARGB(255, 110, 110, 110),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: 80), // เพิ่มช่องว่างระหว่าง Text
                                Text(
                                  '123112',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Color.fromARGB(255, 110, 110, 110),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                    width:
                                        80), // เพิ่มช่องว่างระหว่าง Text และรูปภาพ
                                Image.network(
                                  'https://e7.pngegg.com/pngimages/679/296/png-clipart-award-badge-number-1-first-best-perfect-good-gold-ribbon-bow.png',
                                  width: 40,
                                  height: 40, // ปรับขนาดให้เหมาะสม
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ElevatedButton(
                onPressed: generateRandomNumbers,
                child: Text(
                  'Reset',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Color.fromARGB(255, 153, 153, 153),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
