import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ulangan_pak_aji/controller/history_controller.dart';

import 'package:ulangan_pak_aji/controller/time_controller.dart';

class HistoryWide extends StatelessWidget {
  HistoryWide({super.key});

  final timeC = Get.find<TimeController>();
  final Historyc = Get.find<HistoryController>();  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F0F0F),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F0F0F),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Color(0xFFDBFF00)),
          onPressed: () {},
        ),
        title: const Align(
          alignment: Alignment.centerRight,
          child: Text(
            "Your Activities",
            style: TextStyle(
              color: Color(0xFFDBFF00),
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: const Color(0xFF1A1A1A),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                children: [
                  Center(
                    child: Obx(
                      () => Text(
                        timeC.currentTime.string,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.5,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    top: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFDBFF00),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.add, color: Colors.black),
                        onPressed: () {
                          Get.snackbar(
                            "Tambah Aktivitas",
                            "Fitur ini akan segera hadir!",
                            snackPosition: SnackPosition.BOTTOM,
                            backgroundColor: Colors.black87,
                            colorText: Colors.white,
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              const Text(
                "You have no activities",
                style: TextStyle(
                  color: Color(0xFFDBFF00),
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
