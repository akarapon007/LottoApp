import 'package:flutter/material.dart';
import 'package:lotto_app/pages/first.dart';

class ProfilePage extends StatefulWidget {
  int uid = 0;
  ProfilePage({super.key, required this.uid});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late ImageProvider _profileImage;

  @override
  void initState() {
    super.initState();
    _profileImage = NetworkImage(
        'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/c7bced49-73a3-43c1-b3ce-fe419a596a72/dg62wjw-dc323fd3-124f-4893-b86b-88c7b07c9399.png/v1/fill/w_746,h_1071/eren_jaeger_attack_on_titan_shingeki_render_png_by_marcopolo157_dg62wjw-pre.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9NTc3NiIsInBhdGgiOiJcL2ZcL2M3YmNlZDQ5LTczYTMtNDNjMS1iM2NlLWZlNDE5YTU5NmE3MlwvZGc2Mndqdy1kYzMyM2ZkMy0xMjRmLTQ4OTMtYjg2Yi04OGM3YjA3YzkzOTkucG5nIiwid2lkdGgiOiI8PTQwMjMifV1dLCJhdWQiOlsidXJuOnNlcnZpY2U6aW1hZ2Uub3BlcmF0aW9ucyJdfQ.LYwM0e4pQMZyh5P83VgJ1LTp3_O_7W-lqXEoUTIkbHo'); // กำหนดค่าเริ่มต้นเป็น URL ของรูปภาพ
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
                  'My Profile',
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
                        const Expanded(
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
                    const SizedBox(
                        height: 20), // เพิ่มระยะห่างจาก Row ไปยังส่วนถัดไป

                    SizedBox(
                      height: 400, // ปรับความสูงตามที่ต้องการ
                      child: Container(
                        color: const Color(0xFFFFFFFF),
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.all(
                              16.0), // เพิ่ม padding รอบๆ ข้อความ
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment
                                .start, // จัดแนวข้อความทางซ้าย
                            children: [
                              Row(
                                children: [
                                  const Expanded(
                                    child: Text(
                                      'Personal Information',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w900,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      // เพิ่มฟังก์ชันการทำงานเมื่อกดที่ข้อความนี้
                                      print('Edit tapped');
                                    },
                                    child: const Text(
                                      'Edit',
                                      style: TextStyle(
                                        color: Colors.blue, // สีข้อความ
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                              const Row(
                                children: [
                                  Text(
                                    'Name:',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                  Spacer(), // ใช้ Spacer เพื่อเว้นระยะห่าง
                                  Text(
                                    'Eren Yeager', // ข้อความที่จะแสดงทางขวา
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                              const Row(
                                children: [
                                  Text(
                                    'Email:',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                  Spacer(), // ใช้ Spacer เพื่อเว้นระยะห่าง
                                  Text(
                                    'Eren@gmail.com', // ข้อความที่จะแสดงทางขวา
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                              const Row(
                                children: [
                                  Text(
                                    'Phone:',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                  Spacer(), // ใช้ Spacer เพื่อเว้นระยะห่าง
                                  Text(
                                    '+123 456 7890', // ข้อความที่จะแสดงทางขวา
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                              const Row(
                                children: [
                                  Text(
                                    'Country:',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                  Spacer(), // ใช้ Spacer เพื่อเว้นระยะห่าง
                                  Text(
                                    'Japan', // ข้อความที่จะแสดงทางขวา
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                              const Row(
                                children: [
                                  Text(
                                    'City:',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                  Spacer(), // ใช้ Spacer เพื่อเว้นระยะห่าง
                                  Text(
                                    'Shingeki', // ข้อความที่จะแสดงทางขวา
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20), // เพิ่มระยะห่างระหว่าง container และปุ่ม
                    ElevatedButton(
                      onPressed: () {
                        // Log out function
                        print('User logged out');
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => FirstPage()),
                          (Route<dynamic> route) => false,
                        ); // Navigate to FirstPage and remove previous routes
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red, // Button color
                        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30), // Rounded corners
                        ),
                        shadowColor: Colors.black.withOpacity(0.5), // Drop shadow
                        elevation: 10, // Elevation to make the button stand out
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min, // Adjust button size to content
                        children: [
                          Icon(
                            Icons.logout,
                            color: Colors.white,
                            size: 24,
                          ),
                          SizedBox(width: 10),
                          Text(
                            'Log Out',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
