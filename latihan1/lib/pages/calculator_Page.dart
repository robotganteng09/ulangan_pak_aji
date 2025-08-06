import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan1/controllers/calculator_controller.dart';
import 'package:latihan1/widgetcomponents.dart';

class CalculatorPage extends StatelessWidget {
  CalculatorPage({super.key});

  final CalculatorController calculatorController = Get.put(
    CalculatorController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Calculator Page")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Column()),

            ReuseTextField(
              label: "Enter First Number",
              controller: calculatorController.txtangka1,
              isNUmber: true,
            ),
            ReuseTextField(
              label: "Enter Second Number",
              controller: calculatorController.txtangka2,
              obscureText: false,
              isNUmber: true,
            ),

            const SizedBox(height: 16),

            Center(
              child: Wrap(
                spacing: 90,
                runSpacing: 20,
                children: [
                  SizedBox(
                    width: 80,
                    child: CustomButton(
                      text: "+",
                      margin: 0,
                      onPressed: calculatorController.tambah,
                    ),
                  ),
                  SizedBox(
                    width: 80,
                    child: CustomButton(
                      text: "-",
                      margin: 0,
                      onPressed: calculatorController.kurang,
                    ),
                  ),
                  SizedBox(
                    width: 80,
                    child: CustomButton(
                      text: "/",
                      margin: 0,
                      onPressed: calculatorController.bagi,
                    ),
                  ),
                  SizedBox(
                    width: 80,
                    child: CustomButton(
                      text: "*",
                      margin: 0,
                      onPressed: calculatorController.kali,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            Center(
              child: Obx(
                () => Text(
                  "Hasil: ${calculatorController.texthasil.value}",
                  style: const TextStyle(fontSize: 24),
                ),
              ),
            ),

            const SizedBox(height: 24),

            Center(
              child: SizedBox(
                width: 200,
                child: CustomButton(
                  text: "Clear",
                  margin: 0,
                  onPressed: calculatorController.clear,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
