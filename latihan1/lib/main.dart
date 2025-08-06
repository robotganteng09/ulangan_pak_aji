import 'package:flutter/material.dart';
import 'package:latihan1/pages/calculator_Page.dart';
import 'package:latihan1/pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '11PPLG2',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: CalculatorPage(),
    );
  }
}
