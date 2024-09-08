import 'package:flutter/material.dart';

class Mylotto extends StatefulWidget {
  int uid = 0;
  Mylotto({super.key, required this.uid});

  @override
  State<Mylotto> createState() => _MylottoState();
}

class _MylottoState extends State<Mylotto> {
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            const Color(0xFF453BC9),
        title: const Text(
          'My Lotto',
          style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold), // Set title color to white
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back,
              color: Colors.white), // Set back icon color to white
          onPressed: () {
            Navigator.pop(context); // Action to go back
          },
        ),
        toolbarHeight: 120.0,
      ),
      body: Column(
        children: [
          // ListView below the AppBar
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              itemCount: 4, // Number of boxes to display
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: SizedBox(
                    height: 150, // Height for each item
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            border: Border.all(
                              color: Colors.black, // Border color
                              width: 1.5, // Border width
                            ),
                            color: const Color(0xFFFFFFFF), // Background color
                          ),
                          child: Column(
                            children: [
                              // Colorful label at the top left
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Container(
                                    padding: const EdgeInsets.all(4.0),
                                    width:
                                        MediaQuery.of(context).size.width / 4,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF453BC9),
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 20,
                                          height: 20,
                                          decoration: const BoxDecoration(
                                            color: Colors.white,
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                        const SizedBox(width: 6),
                                        const Text(
                                          'lotto',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 10, left: 5),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: List.generate(6, (i) {
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 3.0),
                                        child: Container(
                                          height: 38,
                                          width: 38,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                              color: Colors.black,
                                              width: 1.5,
                                            ),
                                          ),
                                          child: Center(
                                            child: Text(
                                              '${i + 1}',
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    }),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        // "50 Baht" text at the top right
                        Positioned(
                          top: 30, // Adjusted value to move down
                          right: 10,
                          child: Container(
                            padding: const EdgeInsets.all(8.0),
                            decoration: const BoxDecoration(
                              color: Colors.transparent,
                            ),
                            child: const Text(
                              '50 Baht',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        // "Check" button
                        Positioned(
                          bottom: 8,
                          right: 10,
                          child: ElevatedButton(
                            onPressed: () {
                              print('Check button pressed');
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF453BC9),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12.0, vertical: 6.0),
                              minimumSize: const Size(69, 30),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            child: const Text(
                              'Check',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          // "Update Money" button below the ListView
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                print('Update Money button pressed');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF453BC9),
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 12.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0), // Oval-like shape
                ),
              ),
              child: const Text(
                'Check Lottery',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
