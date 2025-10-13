import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ulangan_pak_aji/controller/history_controller.dart';
import 'package:ulangan_pak_aji/widgets/app_colors.dart';

class HistoryMobile extends StatelessWidget {
  final historyController = Get.find<HistoryController>();

  HistoryMobile({super.key});

  @override
  Widget build(BuildContext context) {
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
      ),
      body: Obx(() {
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
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          itemBuilder: (context, index) {
            final todo = historyController.historyList[index];
            return Container(
              margin: const EdgeInsets.only(bottom: 15),
              decoration: BoxDecoration(
                color: const Color(0xFF333333),
                borderRadius: BorderRadius.circular(16),
              ),
              child: ListTile(
                leading: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: AppColors.neon,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.check, color: Colors.black, size: 20),
                ),
                title: Text(
                  todo['title'] ?? 'No Title',
                  style: TextStyle(
                    color: AppColors.textLight,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                subtitle: Text(
                  todo['description'] ?? 'No Description',
                  style: TextStyle(color: AppColors.textGrey),
                ),
                trailing: IconButton(
                  iconSize: 22,
                  onPressed: () {
                    historyController.deleteHistory(todo['id'], todo['title']);
                  },
                  icon: const Icon(Icons.delete, color: Colors.redAccent),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
