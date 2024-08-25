import 'package:flutter/material.dart';
import 'package:lotto_app/pages/profile.dart';
import 'package:lotto_app/pages/wallet.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
        backgroundColor: const Color(0xFF453BC9),
        automaticallyImplyLeading: false, // Remove the back arrow if it appears
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    color: const Color(0xFF453BC9),
                    height: 100,
                    width: double.infinity,
                    child: const Padding(
                      padding: EdgeInsets.only(bottom: 60.0),
                      child: Center(
                        child: Text(
                          'Search for lucky numbers',
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                            fontSize: 24,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFD9D9D9),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    height: 600,
                    width: 380,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          TextField(
                            decoration: InputDecoration(
                              hintText: 'Search...',
                              suffixIcon: const Icon(Icons.search),
                              filled: true,
                              fillColor: Colors.white,
                              border: InputBorder.none,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50.0),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Expanded(
                            child: Container(
                              color: Color(0xFFFFFFFF),
                              width: double.infinity,
                              child: Column(
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(top:1.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: List.generate(6, (index) {
                                          return CircleAvatar(
                                            radius: 20, // Size of the circle
                                            backgroundColor: Color(0xFF453BC9),
                                            child: Text(
                                              '${index + 1}', // Replace with actual numbers
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16, // Font size
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          );
                                        }),
                                      ),
                                    ),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      print("Buy button pressed");
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          Color(0xFF453BC9), // Background color
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(40.0),
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(
                                          Icons.add,
                                          color: Colors.white,
                                          size: 20,
                                        ),
                                        const SizedBox(width: 8),
                                        Text(
                                          'Buy',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
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
        selectedItemColor: Color(0xFF453BC9), // Set the color for selected item
        unselectedItemColor: Colors.grey, // Set the color for unselected items
        backgroundColor:
            Colors.white, // Set the background color of the bottom bar
        onTap: (int index) {
          if (index == 2) {
            // "Profile" icon is at index 2
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfilePage()),
            );
          } else if (index == 1) {
            // "Wallet" icon is at index 1
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => WalletPage()),
            );
          } else {
            // Handle other tabs
            print("Selected tab: $index");
          }
        },
      ),
    );
  }
}
