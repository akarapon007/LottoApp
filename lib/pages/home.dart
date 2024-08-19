import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
        backgroundColor: const Color(0xFF453BC9),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    color: const Color(
                        0xFF453BC9), // Set the background color to #453BC9
                    height: 100, // Adjust the height as needed
                    width: double.infinity, // Make the container full width
                    child: const Padding(
                      padding: EdgeInsets.only(
                          bottom: 60.0), // Add padding at the top
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
                  const SizedBox(
                      height:
                          150), // Adjust the height to provide space for the overlay
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFD9D9D9), // Change color to #D9D9D9
                      borderRadius: BorderRadius.circular(
                          20), // Set the border radius here
                    ),
                    height: 350,
                    width: 300,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          TextField(
                            decoration: InputDecoration(
                              hintText: 'Search...',
                              suffixIcon: const Icon(
                                  Icons.search), // Move the icon to the right
                              filled: true, // Enable the fill color
                              fillColor: Colors
                                  .white, // Set the background color to white
                              border:
                                  InputBorder.none, // Remove the default border
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide
                                    .none, // Remove the border when focused
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide
                                    .none, // Remove the border when enabled
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
          Positioned(
            top:
                60, // Adjust this value to control how much the container overlaps the app bar
            left: MediaQuery.of(context).size.width * 0.5 -
                150, // Center the container horizontally
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFFD9D9D9), // Change color to #D9D9D9
                borderRadius:
                    BorderRadius.circular(20), // Set the border radius here
              ),
              height: 350,
              width: 300,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Search...',
                        suffixIcon:
                            Icon(Icons.search), // Move the icon to the right
                        filled: true, // Enable the fill color
                        fillColor:
                            Colors.white, // Set the background color to white
                        border: InputBorder.none, // Remove the default border
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide:
                              BorderSide.none, // Remove the border when focused
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40.0),
                          borderSide:
                              BorderSide.none, // Remove the border when enabled
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Align(
                      alignment:
                          Alignment.centerLeft, // Align the Text to the left
                      child: Text(
                        'Lucky Number',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF453BC9),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10), // Add space between text and box
                    Container(
                      color: Color(0xFFE0E0E0), // Color of the box
                      height: 150,
                      width: double.infinity,
                      child: const Center(
                        child: Text(
                          'Lucky Number Here',
                          style: TextStyle(
                            color: Color(0xFF453BC9),
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
