import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ulangan_pak_aji/controller/history_controller.dart';
import 'package:ulangan_pak_aji/widgets/app_colors.dart';

class HistoryWide extends StatelessWidget {
  final historyController = Get.find<HistoryController>();

  HistoryWide({super.key});

  @override
  Widget build(BuildContext context) {
    // Lebar maksimum tampilan list di layar besar
    const double maxListWidth = 700.0;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        title: Text(
          "History",
          style: TextStyle(
            color: AppColors.neon,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        centerTitle: false,
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: maxListWidth),
          child: Obx(() {
            if (historyController.historyList.isEmpty) {
              return Center(
                child: Text(
                  "Belum ada todo",
                  style: TextStyle(color: AppColors.textGrey, fontSize: 16),
                ),
              );
            }

            return ListView.builder(
              itemCount: historyController.historyList.length,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              itemBuilder: (context, index) {
                final todo = historyController.historyList[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 15),
                  decoration: BoxDecoration(
                    color: const Color(0xFF333333),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    leading: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: AppColors.neon,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.check,
                        color: Colors.black,
                        size: 20,
                      ),
                    ),
                    title: Text(
                      todo['title'] ?? 'No Title',
                      style: TextStyle(
                        color: AppColors.textLight,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    subtitle: Text(
                      todo['description'] ?? 'No Description',
                      style: TextStyle(color: AppColors.textGrey, fontSize: 14),
                    ),
                    trailing: IconButton(
                      iconSize: 24,
                      onPressed: () {
                        historyController.deleteHistory(
                          todo['id'],
                          todo['title'],
                        );
                      },
                      icon: const Icon(
                        Icons.delete_outline,
                        color: Colors.redAccent,
                      ),
                    ),
                  ),
                );
              },
            );
          }),
        ),
      ),
    );
  }
}
