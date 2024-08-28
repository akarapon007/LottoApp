import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';

class EditProfilePage extends StatefulWidget {
  int uid = 0;
  EditProfilePage({super.key, required this.uid});
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  late ImageProvider _profileImage;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool _isAccepted = false;

  // BoxDecoration ที่ใช้ใน Container
  final BoxDecoration _boxDecoration = BoxDecoration(
    color: const Color(0xFFD9D9D9),
    borderRadius: BorderRadius.circular(40.0),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.5),
        spreadRadius: 5,
        blurRadius: 7,
        offset: const Offset(0, 3),
      ),
    ],
  );

  @override
  void initState() {
    super.initState();
    _profileImage = NetworkImage(
        'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/c7bced49-73a3-43c1-b3ce-fe419a596a72/dg62wjw-dc323fd3-124f-4893-b86b-88c7b07c9399.png/v1/fill/w_746,h_1071/eren_jaeger_attack_on_titan_shingeki_render_png_by_marcopolo157_dg62wjw-pre.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9NTc3NiIsInBhdGgiOiJcL2ZcL2M3YmNlZDQ5LTczYTMtNDNjMS1iM2NlLWZlNDE5YTU5NmE3MlwvZGc2Mndqdy1kYzMyM2ZkMy0xMjRmLTQ4OTMtYjg2Yi04OGM3YjA3YzkzOTkucG5nIiwid2lkdGgiOiI8PTQwMjMifV1dLCJhdWQiOlsidXJuOnNlcnZpY2U6aW1hZ2Uub3BlcmF0aW9ucyJdfQ.LYwM0e4pQMZyh5P83VgJ1LTp3_O_7W-lqXEoUTIkbHo'); // กำหนดค่าเริ่มต้นเป็น URL ของรูปภาพ
  }

  void _register() {
    // ฟังก์ชันสำหรับการสมัคร
    print("Register button pressed");
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
            // Top section with background color
            Container(
              color: const Color(0xFF453BC9),
              height: 50,
              width: double.infinity,
              child: const Center(
                child: Text(
                  'Edit Profile',
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFFD9D9D9),
                borderRadius: BorderRadius.circular(20),
              ),
              width: 380,
              height: 530,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    // ใช้ Row เพื่อวางรูปโปรไฟล์และข้อความ
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _profileImage = const NetworkImage(
                                  'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/c7bced49-73a3-43c1-b3ce-fe419a596a72/dg62wjw-dc323fd3-124f-4893-b86b-88c7b07c9399.png/v1/fill/w_746,h_1071/eren_jaeger_attack_on_titan_shingeki_render_png_by_marcopolo157_dg62wjw-pre.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9NTc3NiIsInBhdGgiOiJcL2ZcL2M3YmNlZDQ5LTczYTMtNDNjMS1iM2NlLWZlNDE5YTU5NmE3MlwvZGc2Mndqdy1kYzMyM2ZkMy0xMjRmLTQ4OTMtYjg2Yi04OGM3YjA3YzkzOTkucG5nIiwid2lkdGgiOiI8PTQwMjMifV1dLCJhdWQiOlsidXJuOnNlcnZpY2U6aW1hZ2Uub3BlcmF0aW9ucyJdfQ.LYwM0e4pQMZyh5P83VgJ1LTp3_O_7W-lqXEoUTIkbHo'); // เปลี่ยน URL เป็น URL ของรูปภาพที่ต้องการ
                            });
                          },
                          child: CircleAvatar(
                            radius: 40.0,
                            backgroundImage: _profileImage,
                            child: _profileImage is NetworkImage
                                ? null
                                : const Icon(Icons.camera_alt,
                                    size: 40.0, color: Colors.white),
                          ),
                        ),
                        const SizedBox(
                            width:
                                20), // เพิ่มระยะห่างระหว่างรูปโปรไฟล์กับข้อความ
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Eren Yeager', // ชื่อผู้ใช้หรือข้อความที่ต้องการแสดง
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                'Eren@gmail.com', // ข้อความเพิ่มเติมหรือคำบรรยาย
                                style: TextStyle(
                                  color: Color.fromARGB(255, 133, 133, 133),
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16.0),
                    TextField(
                      controller: _usernameController,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white, // สีพื้นหลังของช่องข้อความ
                        labelText: 'Eren Yeager',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(45.0)),
                        ),
                        prefixIcon: Icon(Icons.person),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    TextField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white, // สีพื้นหลังของช่องข้อความ
                        labelText: 'Eren@gmail.com',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(45.0)),
                        ),
                        prefixIcon: Icon(Icons.email),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    TextField(
                      controller: _phoneController,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white, // สีพื้นหลังของช่องข้อความ
                        labelText: '+123 456 7890',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(45.0)),
                        ),
                        prefixIcon: Icon(Icons.phone),
                      ),
                    ),
                    const SizedBox(height: 16.0),

                    TextField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white, // สีพื้นหลังของช่องข้อความ
                        labelText: 'Japan',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(45.0)),
                        ),
                        prefixIcon: Icon(Icons.public),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    TextField(
                      controller: _confirmPasswordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white, // สีพื้นหลังของช่องข้อความ
                        labelText: 'Shingeki',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(45.0)),
                        ),
                        prefixIcon: Icon(Icons.pin_drop),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16.0),

            Container(
              width: 200.0, // ความกว้างของปุ่ม
              height: 50.0, // ความสูงของปุ่ม
              child: ElevatedButton(
                onPressed: _register, // ฟังก์ชันที่เรียกเมื่อปุ่มถูกกด
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF453BC9), // สีพื้นหลังของปุ่ม
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0), // รูปทรงของปุ่ม
                  ),
                ),
                child: const Text(
                  'Update Profile',
                  style: TextStyle(
                    color: Colors.white, // สีข้อความ
                    fontSize: 16.0, // ขนาดข้อความ
                    fontWeight: FontWeight.bold, // น้ำหนักข้อความ
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
