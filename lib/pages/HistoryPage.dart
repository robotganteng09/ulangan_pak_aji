import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/instance_manager.dart';
import 'package:ulangan_pak_aji/controller/history_controller.dart';
import 'package:ulangan_pak_aji/widgets/app_colors.dart';

class History extends StatelessWidget {
  final HistoryController historyController = Get.find<HistoryController>();

  History({super.key});

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
        if (historyController.completedList.isEmpty) {
          return Center(
            child: Text(
              "Belum ada todo",
              style: TextStyle(color: AppColors.textGrey, fontSize: 16),
            ),
          );
        }
        return ListView.builder(
          padding: const EdgeInsets.all(12),
          itemCount: historyController.completedList.length,
          itemBuilder: (context, index) {
            final todo = historyController.completedList[index];
            return Container(
              margin: const EdgeInsets.only(bottom: 12),
              decoration: BoxDecoration(
                color: Colors.grey[850],
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
                  todo.Title,
                  style: TextStyle(
                    color: AppColors.textLight,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
                subtitle: Text(
                  todo.Description,
                  style: TextStyle(color: AppColors.textGrey),
                ),

                //icon tong sampah
                trailing: IconButton(
                  onPressed: () {
                    historyController.deleteHistory(todo);
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
