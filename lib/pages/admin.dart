import 'package:flutter/material.dart';
import 'dart:math';

class Adminpage extends StatefulWidget {
  @override
  _AdminpageState createState() => _AdminpageState();
}

class _AdminpageState extends State<Adminpage> {
  List<int> randomNumbers = List.generate(6, (index) => index + 1);

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
                                  color:
                                      const Color.fromARGB(255, 255, 255, 255),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  '${randomNumbers[index]}',
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: ElevatedButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return RandomButton(
                                    onClose: () {
                                      Navigator.of(context)
                                          .pop(); // Close dialog
                                    },
                                    onRefresh: () {
                                      // _handleRefresh();
                                    },
                                  );
                                },
                              );
                            },
                            child: const Text(
                              'Random',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor:
                                  const Color.fromARGB(255, 153, 153, 153),
                              padding: const EdgeInsets.symmetric(
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
                      offset: const Offset(0, 3),
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
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Color.fromARGB(255, 110, 110, 110),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                    width: 80), // เพิ่มช่องว่างระหว่าง Text
                                const Text(
                                  '123112',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Color.fromARGB(255, 110, 110, 110),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
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
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return ResetButtonn(
                        onClose: () {
                          Navigator.of(context).pop(); // ปิด Dialog
                        },
                        onRefresh: () {
                          // _handleRefresh();
                        },
                      );
                    },
                  );
                },
                child: const Text(
                  'Reset',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: const Color.fromARGB(255, 153, 153, 153),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
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

class RandomButton extends StatefulWidget {
  final VoidCallback onClose;
  final VoidCallback onRefresh;
  const RandomButton({Key? key, required this.onClose, required this.onRefresh})
      : super(key: key);

  @override
  _RandomButtonState createState() => _RandomButtonState();
}

class _RandomButtonState extends State<RandomButton> {
  int _selectedCheckbox = -1;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Container(
        width: 300,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 300,
              padding: const EdgeInsets.all(16.0),
              decoration: const BoxDecoration(
                color: Color(0xFF453BC9),
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: const Text(
                'สุ่มออกรางวัล',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                children: [
                  Transform.scale(
                    scale: 1.5,
                    child: Checkbox(
                      value: _selectedCheckbox == 0,
                      onChanged: (bool? newValue) {
                        setState(() {
                          _selectedCheckbox = 0;
                        });
                      },
                      fillColor: MaterialStateProperty.resolveWith((states) {
                        if (states.contains(MaterialState.selected)) {
                          return const Color.fromRGBO(70, 189, 108, 1);
                        }
                        return const Color(0xFF453BC9);
                      }),
                    ),
                  ),
                  const Text('สุ่มจากสลากทั้งหมด'),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                children: [
                  Transform.scale(
                    scale: 1.5,
                    child: Checkbox(
                      value: _selectedCheckbox == 1,
                      onChanged: (bool? newValue) {
                        setState(() {
                          _selectedCheckbox = 1;
                        });
                      },
                      fillColor: MaterialStateProperty.resolveWith((states) {
                        if (states.contains(MaterialState.selected)) {
                          return const Color.fromRGBO(70, 189, 108, 1);
                        }
                        return const Color(0xFF453BC9);
                      }),
                    ),
                  ),
                  const Text('สุ่มจากสลากที่ลูกค้าซื้อ'),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.red[400],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  width: 75,
                  child: IconButton(
                    icon:
                        const Icon(Icons.close, color: Colors.white, size: 30),
                    onPressed: widget.onClose,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.green[400],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  width: 75,
                  child: IconButton(
                    icon:
                        const Icon(Icons.check, color: Colors.white, size: 30),
                    onPressed: () {
                      // You might want to add a check function here
                      // check(context, _selectedCheckbox, widget.onRefresh);
                      widget.onRefresh();
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

class ResetButtonn extends StatelessWidget {
  final VoidCallback onClose;
  final VoidCallback onRefresh; // เพิ่มพารามิเตอร์นี้
  ResetButtonn({required this.onClose, required this.onRefresh});
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Container(
        width: 300,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 15),
              decoration: const BoxDecoration(
                color: Color(0xFF453BC9), // Purple color from the image
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: const Text(
                'รีเซ็ตระบบใหม่',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const Text(
                    'สร้างสลากจำนวน:',
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: "ขั้นต่ำ 100 ใบ",
                      hintStyle: TextStyle(
                        color: Colors.grey, // สีจางสำหรับข้อความ
                        fontWeight: FontWeight.w300, // น้ำหนักตัวอักษรจาง
                      ),
                      border: UnderlineInputBorder(),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'การรีเซ็ตระบบใหม่จะทำให้ข้อมูล\nลูกค้าและสลากหายทั้งหมด\nคุณแน่ใจหรือไม่?',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.red, fontSize: 14),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceEvenly, // จัดปุ่มแยกคนละฝั่ง
                    children: [
                      _buildActionButtonn(
                          Icons.close, const Color(0xFFE74C3C), onClose),
                      _buildActionButtonn(Icons.check, const Color(0xFF2ECC71), () {
                        // reset(context);
                        // เพิ่มการกระทำเมื่อกดปุ่มยืนยันที่นี่
                      }),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButtonn(
      IconData icon, Color color, VoidCallback onPressed) {
    return Container(
      decoration: BoxDecoration(
        color: color, // ใช้สีที่ส่งผ่านมาจาก Row
        borderRadius: BorderRadius.circular(20),
      ),
      width: 75,
      child: IconButton(
        icon: Icon(icon, color: Colors.white),
        onPressed: onPressed,
      ),
    );
  }
}
