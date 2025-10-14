import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ulangan_pak_aji/controller/home_controller.dart';
import 'package:ulangan_pak_aji/controller/time_controller.dart';
import 'package:ulangan_pak_aji/routes/route.dart';
import 'package:ulangan_pak_aji/widgets/app_colors.dart';

class HomeWide extends StatelessWidget {
  const HomeWide({super.key});

  @override
  Widget build(BuildContext context) {
    final homeController = Get.find<HomeController>();
    final timeC = Get.find<TimeController>();
    const double maxListWidth = 600.0;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        // 🔹 title dihapus
        centerTitle: false,
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 16),
            width: 42,
            height: 42,
            child: FloatingActionButton(
              heroTag: "add_activity_appbar",
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              backgroundColor: AppColors.neon,
              child: const Icon(Icons.add, color: Colors.black, size: 24),
              onPressed: () => Get.toNamed(AppRoutes.addWidepage),
            ),
          ),
        ],
      ),

      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: maxListWidth),
          child: Obx(
            () => ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              children: [
                // jam
                Padding(
                  padding: const EdgeInsets.only(top: 40, bottom: 40),
                  child: Center(
                    child: Text(
                      DateFormat('hh:mm:ss a').format(timeC.currentTime.value),
                      style: TextStyle(
                        color: AppColors.textLight,
                        fontSize: 38,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                      ),
                    ),
                  ),
                ),

                // if list empty
                if (homeController.todolist.isEmpty)
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 60),
                      child: Text(
                        "You have no activities",
                        style: TextStyle(
                          color: AppColors.textGrey,
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  )
                else
                  ...List.generate(homeController.todolist.length, (index) {
                    final todo = homeController.todolist[index];
                    final title = todo['title'] ?? '';
                    final description = todo['description'] ?? '';
                    final category = todo['category'] ?? '';
                    final isDone = (todo['isDone'] ?? 0) == 1;
                    final dueDateStr = todo['dueDate'] ?? '';
                    DateTime? dueDate;

                    if (dueDateStr.isNotEmpty) {
                      try {
                        dueDate = DateTime.parse(dueDateStr);
                      } catch (_) {
                        dueDate = null;
                      }
                    }

                    return GestureDetector(
                      onTap: () {
                        Get.toNamed(
                          AppRoutes.EditWidepage,
                          arguments: {'index': index, 'todo': todo},
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          color: const Color(0xFF333333),
                          borderRadius: BorderRadius.circular(16),
                          border: index == 0
                              ? Border.all(
                                  color: AppColors.neon.withOpacity(0.6),
                                  width: 2,
                                )
                              : null,
                        ),
                        child: ListTile(
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ),
                          title: Text(
                            title,
                            style: TextStyle(
                              color: AppColors.neon,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 4),
                              Text(
                                description,
                                style: TextStyle(
                                  color: AppColors.textLight,
                                  fontSize: 14,
                                ),
                              ),
                              if (category.isNotEmpty) ...[
                                const SizedBox(height: 4),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 2,
                                  ),
                                  child: Text(
                                    "Category: ${category.toUpperCase()}",
                                    style: TextStyle(
                                      color: AppColors.textGrey,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ],
                              const SizedBox(height: 8),
                              Text(
                                dueDate != null
                                    ? "Due: ${DateFormat('d MMMM yyyy').format(dueDate)}"
                                    : "Due: No date set",
                                style: TextStyle(
                                  color: AppColors.textGrey.withOpacity(0.7),
                                  fontSize: 13,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ],
                          ),
                          trailing: InkWell(
                            onTap: () {
                              homeController.updateList(
                                index,
                                title,
                                description,
                                !isDone,
                                category,
                                dueDate,
                              );
                            },
                            child: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: isDone
                                    ? AppColors.neon
                                    : Colors.transparent,
                                border: Border.all(
                                  color: AppColors.neon,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Icon(
                                Icons.check,
                                color: isDone ? Colors.black : AppColors.neon,
                                size: 28,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
