import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ulangan_pak_aji/controller/drop_down_controller.dart';
import 'package:ulangan_pak_aji/controller/home_controller.dart';
import 'package:ulangan_pak_aji/routes/route.dart';
import 'package:ulangan_pak_aji/widgets/app_colors.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    final homeController = Get.find<HomeController>();
    final dropdownC = Get.find<DropDownController>();

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        title: Row(
          children: [
            Text(
              "Your Activities",
              style: TextStyle(
                color: AppColors.neon,
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            const SizedBox(width: 5),
          ],
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(5),
        child: Obx(
          () => homeController.todolist.isEmpty
              ? Center(
                  child: Text(
                    "No activities yet",
                    style: TextStyle(color: AppColors.textGrey, fontSize: 16),
                  ),
                )
              : ListView.builder(
                  itemCount: homeController.todolist.length,
                  itemBuilder: (context, index) {
                    final todo = homeController.todolist[index];
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed(
                          AppRoutes.Editpage,
                          arguments: {'index': index, 'todo': todo},
                        );
                      },
                      child: Card(
                        color: Colors.grey[850],
                        margin: const EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 8,
                        ),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                todo.Title,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: AppColors.neon,
                                ),
                              ),
                              Text(
                                todo.Description,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: AppColors.textLight,
                                ),
                              ),
                              Text(
                                "Category: ${todo.category}",
                                style: TextStyle(
                                  fontSize: 13,
                                  color: AppColors.textGrey,
                                ),
                              ),
                              Text(
                                todo.dueDate != null
                                    ? "Due Date: ${todo.dueDate!.day}/${todo.dueDate!.month}/${todo.dueDate!.year}"
                                    : "No due date",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.redAccent,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Status: ",
                                    style: TextStyle(
                                      color: AppColors.textLight,
                                      fontSize: 14,
                                    ),
                                  ),
                                  Checkbox(
                                    activeColor: AppColors.neon,
                                    checkColor: Colors.black,
                                    value: todo.isDone,
                                    onChanged: (value) {
                                      if (value != null) {
                                        homeController.UpdateList(
                                          index,
                                          todo.Title,
                                          todo.Description,
                                          value,
                                          todo.category,
                                          todo.dueDate,
                                        );
                                      }
                                    },
                                  ),
                                  Text(
                                    todo.isDone ? "Selesai" : "Belum Selesai",
                                    style: TextStyle(
                                      color: AppColors.textGrey,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.neon,
        child: const Icon(Icons.add, color: Colors.black, size: 28),
        onPressed: () {
          Get.toNamed(AppRoutes.Addpage);
        },
      ),
    );
  }
}
