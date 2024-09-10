import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lotto_app/config/config.dart';
import 'package:lotto_app/models/response/lottoGetRes.dart';

class Adminpage extends StatefulWidget {
  @override
  _AdminpageState createState() => _AdminpageState();
}

class _AdminpageState extends State<Adminpage> {
  List<int> randomNumbers = List.generate(6, (index) => index + 1);
  late Future<List<LottoGetRes>> loadData;
  @override
  void initState() {
    super.initState();
    loadData = loadDataAsync();
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
                                      setState(() {
                                        loadData = loadDataAsync();
                                      });
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
            FutureBuilder<List<LottoGetRes>>(
              future: loadData,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  // ขณะกำลังดึงข้อมูล
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  // หากมีข้อผิดพลาด
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (snapshot.hasData) {
                  // เมื่อดึงข้อมูลเสร็จสิ้น
                  var lottoList = snapshot.data!;
                  return SizedBox(
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
                              itemCount: lottoList.isEmpty
                                  ? 5
                                  : lottoList
                                      .length, // กำหนดเป็น 5 ถ้า length เป็น 0
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
                                        'รางวัลที่ ${lottoList.isNotEmpty ? lottoList[index].prize ?? '?' : (index + 1)}', // แสดงเลข 1-5 แทน ? ถ้าไม่มีข้อมูล
                                        style: const TextStyle(
                                          fontSize: 16,
                                          color: Color.fromARGB(
                                              255, 110, 110, 110),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(
                                          width:
                                              80), // เพิ่มช่องว่างระหว่าง Text
                                      Text(
                                        '${lottoList.isNotEmpty ? lottoList[index].number ?? '?' : '??????'}', // ใช้ ?? '?' ถ้า number เป็น null
                                        style: const TextStyle(
                                          fontSize: 18,
                                          color: Color.fromARGB(
                                              255, 110, 110, 110),
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
                  );
                } else {
                  return Center(child: Text('No data available'));
                }
              },
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
                          setState(() {
                            loadData = loadDataAsync();
                          });
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

  Future<List<LottoGetRes>> loadDataAsync() async {
    var value = await Configuration.getConfig();
    String url = value['apiEndPoint'];

    var response = await http
        .get(Uri.parse('https://nodejs-wfjd.onrender.com/lotto/seprize'));
    if (response.statusCode == 200) {
      return lottoGetResFromJson(response.body);
    } else {
      throw Exception('Failed to load lotto data');
    }
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

                      check(context, _selectedCheckbox, widget.onRefresh);
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

  void check(BuildContext context, int se, VoidCallback onRefresh) async {
    // แสดง Dialog ขณะกำลังดำเนินการ
    log(se.toString());
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        titlePadding: EdgeInsets.zero,
        title: Container(
          padding: const EdgeInsets.all(12.0),
          decoration: const BoxDecoration(
            color: Colors.purple,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
          ),
          child: const Text(
            'กำลังดำเนินการ',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ),
        content: const Text(
          'กรุณารอสักครู่...',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
          ),
        ),
      ),
    );

    try {
      // รับค่า Configuration
      var value = await Configuration.getConfig();
      String url = value['apiEndPoint'];

      // เลือกเส้นที่เหมาะสมตามค่า se
      String endpoint;
      if (se == 1) {
        endpoint = '/admin/ranprizeuser'; // เส้นที่ 1
      } else if (se == 0) {
        endpoint = '/admin/ranprizeall'; // เส้นที่ 2
      } else {
        throw Exception('Invalid value for se: $se');
      }

      // ส่งคำขอไปยัง API
      var response = await http.get(Uri.parse('$url$endpoint'));
      log('Response status: ${response.statusCode}');
      log('Response body: ${response.body}');
      // ตรวจสอบสถานะการตอบสนอง
      if (response.statusCode == 200 || response.statusCode == 201) {
        // สุ่มสำเร็จ
        Navigator.pop(context); // ปิด Dialog
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            titlePadding: EdgeInsets.zero,
            title: Container(
              padding: const EdgeInsets.all(12.0),
              decoration: const BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
              ),
              child: const Text(
                'สำเร็จ',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
            content: const Text(
              'สุ่มสำเร็จ',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // ปิด Dialog
                  onRefresh(); // เรียกฟังก์ชันรีเฟรช
                },
                child: const Text('ตกลง'),
              ),
            ],
          ),
        );
      } else {
        // การตอบสนองไม่สำเร็จ
        Navigator.pop(context); // ปิด Dialog
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            titlePadding: EdgeInsets.zero,
            title: Container(
              padding: const EdgeInsets.all(12.0),
              decoration: const BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
              ),
              child: const Text(
                'ข้อผิดพลาด',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
            content: const Text(
              'เเอดมินได้ทำการสุ่มไปแล้วหรือสลากขายออกไม่ครบ5ใบ',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // ปิด Dialog
                },
                child: const Text('ตกลง'),
              ),
            ],
          ),
        );
      }
    } catch (e) {
      // การจัดการข้อผิดพลาด
      Navigator.pop(context); // ปิด Dialog
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          titlePadding: EdgeInsets.zero,
          title: Container(
            padding: const EdgeInsets.all(12.0),
            decoration: const BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
            ),
            child: const Text(
              'ข้อผิดพลาด',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
          content: Text(
            'กรุณาเลือกระหว่าง สุ่มทั้งหมด หรือ สุ่มจากสลากที่ซื้อ',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context); // ปิด Dialog
              },
              child: const Text('ตกลง'),
            ),
          ],
        ),
      );
    }
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
                    'การรีเซ็ตระบบใหม่จะทำให้ข้อมูล\nลูกค้าและส  ลากหายทั้งหมด\nคุณแน่ใจหรือไม่?',
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
                      _buildActionButtonn(Icons.check, const Color(0xFF2ECC71),
                          () {
                        reset(context);
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

  void reset(BuildContext context) async {
    String amountString = _controller.text;
    int? amount = int.tryParse(amountString);

    if (amount == null || amount < 100) {
      Navigator.pop(context); // ปิด Dialog
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          titlePadding: EdgeInsets.zero,
          title: Container(
            padding: const EdgeInsets.all(12.0),
            decoration: const BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
            ),
            child: const Text(
              'ข้อผิดพลาด',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
          content: Text(
            amount == null
                ? 'กรุณากรอกจำนวนที่ถูกต้อง'
                : 'กรุณาใส่จำนวนที่มากว่า 100',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context); // ปิด Dialog
              },
              child: const Text('ตกลง'),
            ),
          ],
        ),
      );
      return;
    }

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        content: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            CircularProgressIndicator(),
            SizedBox(width: 20),
            Text("กำลังรีเซ็ตระบบ...")
          ],
        ),
      ),
    );

    try {
      var value = await Configuration.getConfig();
      String url = value['apiEndPoint'];
      var response =
          await http.get(Uri.parse('$url/admin/randomlottory/$amount'));
      log('จำนวนสลาก $amount ใบ');
      Navigator.pop(context); // ปิด Dialog

      if (response.statusCode == 200 || response.statusCode == 201) {
        // สุ่มสำเร็จ
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            titlePadding: EdgeInsets.zero,
            title: Container(
              padding: const EdgeInsets.all(12.0),
              decoration: const BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
              ),
              child: const Text(
                'สำเร็จ',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
            content: const Text(
              'ทำการรีเซ็ตระบบสำเร็จ',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // ปิด Dialog
                  onRefresh(); // เรียกฟังก์ชันรีเฟรช
                },
                child: const Text('ตกลง'),
              ),
            ],
          ),
        );
      } else {
        // การตอบสนองไม่สำเร็จ
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            titlePadding: EdgeInsets.zero,
            title: Container(
              padding: const EdgeInsets.all(12.0),
              decoration: const BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
              ),
              child: const Text(
                'ข้อผิดพลาด',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
            content: const Text(
              'Admin ได้ทำการรีระบบไปแล้วรอออกรางวัลก่อนจึงจะรีระบบได้',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // ปิด Dialog
                },
                child: const Text('ตกลง'),
              ),
            ],
          ),
        );
      }
    } catch (e) {
      // การจัดการข้อผิดพลาด
      Navigator.pop(context); // ปิด Dialog
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          titlePadding: EdgeInsets.zero,
          title: Container(
            padding: const EdgeInsets.all(12.0),
            decoration: const BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
            ),
            child: const Text(
              'ข้อผิดพลาด',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
          content: Text(
            'ERROR DATABASE',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context); // ปิด Dialog
              },
              child: const Text('ตกลง'),
            ),
          ],
        ),
      );
    }
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
