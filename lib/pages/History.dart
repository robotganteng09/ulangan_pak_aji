import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/instance_manager.dart';
import 'package:ulangan_pak_aji/controller/history_controller.dart';
import 'package:ulangan_pak_aji/widgets/cardReusable.dart';

class History extends StatelessWidget {
  final historyController = Get.find<HistoryController>();

  History({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("History")),
      body: Obx(() {
        if (historyController.completedList.isEmpty) {
          return const Center(child: Text("Belum ada todo"));
        }
        return ListView.builder(
          itemCount: historyController.completedList.length,
          itemBuilder: (context, index) {
            final todo = historyController.completedList[index];
            return Column(
              children: [
                TodoCard(
                  title: todo.Title,
                  description: todo.Description,
                  isDone: true,
                  trailing: IconButton(
                    onPressed: () {
                      historyController.deleteHistory(todo);
                    },
                    icon: Icon(Icons.delete),
                  ),
                ),
              ],
            );
          },
        );
      }),
    );
  }
}
