import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/instance_manager.dart';
import 'package:ulangan_pak_aji/controller/history_controller.dart';
import 'package:ulangan_pak_aji/widgets/app_colors.dart';

class HistoryWide extends StatelessWidget {
  final historyController = Get.find<HistoryController>();

  HistoryWide({super.key});

  @override
  Widget build(BuildContext context) {
    // A sensible maximum width for a list on a wide screen
    const double maxListWidth = 600.0;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        // Aligned to the top-right in the image, so we use the title and actions
        title: Text(
          "Your History",
          style: TextStyle(
            color: AppColors.neon,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        centerTitle: false, // Align title to the start
        actions: [
          IconButton(
            onPressed: () {
              // Action for the plus button, if needed
            },
            icon: Container(
              decoration: BoxDecoration(
                color: AppColors.neon,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(Icons.add, color: Colors.black),
            ),
          ),
          const SizedBox(width: 12),
        ],
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
              itemCount:
                  historyController.historyList.length +
                  2, // +1 for time, +1 for divider
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 0, // Padding for the whole list
              ),
              itemBuilder: (context, index) {
                // 1. Time Header (Index 0)
                if (index == 0) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Center(
                          child: Text(
                            "11:01:01 AM",
                            style: TextStyle(
                              color: AppColors.textLight,
                              fontWeight: FontWeight.bold,
                              fontSize: 30, // Larger size to match the image
                            ),
                          ),
                        ),
                      ),
                      // 2. Separator Line (Index 1)
                      const Divider(color: Colors.white10, height: 1),
                    ],
                  );
                }

                // Adjust index to correctly fetch the todo item
                // index 1 is the divider, so the first todo is at index 2
                final todoIndex = index - 2;

                // Only render items if the index is within the bounds of the actual list
                if (todoIndex < 0 ||
                    todoIndex >= historyController.historyList.length) {
                  return const SizedBox.shrink();
                }

                final todo = historyController.historyList[todoIndex];

                // 3. Todo List Item
                return Container(
                  margin: const EdgeInsets.only(
                    top: 15,
                    bottom: 5,
                  ), // Adjusted top margin to separate from the line/previous item
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                    color: const Color(0xFF333333),
                    borderRadius: BorderRadius.circular(16),
                    border:
                        todoIndex ==
                            0 // Highlight the first todo item
                        ? Border.all(
                            color: AppColors.neon.withOpacity(0.7),
                            width: 2,
                          )
                        : null,
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 4,
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
                        color: AppColors.neon,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 4),
                        Text(
                          todo['description'] ?? 'No Description',
                          style: TextStyle(
                            color: AppColors.textLight.withOpacity(0.8),
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          "Due: ${todo['dueDate'] ?? 'N/A'}",
                          style: TextStyle(
                            color: AppColors.textGrey.withOpacity(0.6),
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    isThreeLine: true,
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
