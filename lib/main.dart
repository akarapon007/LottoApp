import 'package:flutter/material.dart';
import 'package:lotto_app/pages/first.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Octopus Lotto',
    home: FirstPage(),);
  }
}
