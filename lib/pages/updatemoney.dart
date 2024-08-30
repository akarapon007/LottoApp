import 'package:flutter/material.dart';

class UpdateMoneyPage extends StatefulWidget {
  @override
  _UpdateMoneyPageState createState() => _UpdateMoneyPageState();
}

class _UpdateMoneyPageState extends State<UpdateMoneyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0), // Set the height of the AppBar
        child: AppBar(
          backgroundColor: const Color(0xFF453BC9),
          flexibleSpace: const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Update Money',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          const Divider(
            color: Color.fromARGB(255, 134, 134, 134), // Color of the first line
            thickness: 2, // Thickness of the first line
            height: 50, // Space below the first line
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                width: 150, // Set a fixed width to align with the right side
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Recipient',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8), // Space between text lines
                    Text(
                      'Member ID',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.centerRight, // Align text to the right
                padding: const EdgeInsets.symmetric(horizontal: 16.0), // Add horizontal padding
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'นาย พชร  วงคำเหลา',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 8), // Space between text lines
                    Text(
                      'KUY49',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Divider(
            color: Color.fromARGB(255, 134, 134, 134), // Color of the second line
            thickness: 2, // Thickness of the second line
            height: 50, // Space above the second line
          ),
          Container(
            width: 300, // Width of the square
            height: 120, // Increased height to accommodate rows of squares
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black, // Border color
                width: 2, // Border width
              ),
              borderRadius: BorderRadius.circular(16.0), // Border radius
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0), // Add vertical padding to keep text from touching the border
                  child: Text(
                    'Lottery Ticket Number.',
                    style: TextStyle(
                      fontSize: 16, // Font size of the text
                      color: Colors.black, // Color of the text
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center, // Center the text horizontally
                  ),
                ),
                const SizedBox(height: 16), // Space between the text and squares
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(6, (index) {
                      return Container(
                        width: 40, // Width of each small square
                        height: 40, // Height of each small square
                        margin: const EdgeInsets.symmetric(horizontal: 4.0), // Space between squares
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black, // Border color
                            width: 1, // Border width
                          ),
                          borderRadius: BorderRadius.circular(8.0), // Border radius
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            color: Color.fromARGB(255, 134, 134, 134), // Color of the third line
            thickness: 2, // Thickness of the third line
            height: 50, // Space below the third line
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                width: 150, // Set a fixed width to align with the right side
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Price money',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8), // Space between text lines
                    Text(
                      'Tax amount',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8), // Space between text lines
                    Text(
                      'Received',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.centerRight, // Align text to the right
                padding: const EdgeInsets.symmetric(horizontal: 16.0), // Add horizontal padding
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '50  Baht',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 8), // Space between text lines
                    Text(
                      '50  Baht',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 8), // Space between text lines
                    Text(
                      '50  Baht',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Divider(
            color: Color.fromARGB(255, 134, 134, 134), // Color of the fourth line
            thickness: 2, // Thickness of the fourth line
            height: 50, // Space below the fourth line
          ),
          Padding(
            padding: const EdgeInsets.all(0), // Add padding around the button
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  // Handle the button press
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF453BC9), // Background color of the button
                  padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 12.0), // Padding inside the button
                ),
                child: const Text(
                  'Confirm Update',
                  style: TextStyle(
                    fontSize: 16, // Font size of the button text
                    color: Colors.white, // Color of the button text
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
