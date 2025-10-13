import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/instance_manager.dart';
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
        // The title is now part of the body for better control over placement and style
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
          // Use a column and ListView.builder so we can add the 11:01 AM chip.
          // For a simple list, we can just use a Column as the main body.
          // Since the list items are identical, it is assumed they are for the same time,
          // matching the single "11:01AM" chip in the image.
          itemCount:
              historyController.historyList.length + 1, // +1 for the time chip
          padding: const EdgeInsets.only(
            top: 0,
            left: 12,
            right: 12,
            bottom: 12,
          ),
          itemBuilder: (context, index) {
            // First item is the time chip
            if (index == 0) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey[900], // Darker background for the chip
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      "11:01AM",
                      style: TextStyle(
                        color: AppColors.textLight, // White/Light text
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              );
            }

            final todo = historyController.historyList[index - 1];
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
