import 'package:flutter/material.dart';

class ExampleWidescreen extends StatelessWidget {
  const ExampleWidescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ini wide layout")),
      body: const Center(child: Text("Ini wide HP")),
    );
  }
}
