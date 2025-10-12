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
    const double standardPadding = 16.0;

    return Scaffold(
      drawer: Drawer(
        backgroundColor: const Color(0xFF1A1A1A),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: AppColors.neon.withOpacity(0.2)),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: AppColors.neon,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home, color: Colors.white),
              title: const Text(
                'Beranda',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Get.back(); // Menutup drawer
              },
            ),
            ListTile(
              leading: const Icon(Icons.person, color: Colors.white),
              title: const Text(
                'Profile',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Get.toNamed(AppRoutes.Profillepage);
              },
            ),
            ListTile(
              leading: const Icon(Icons.info, color: Colors.white),
              title: const Text(
                'Tentang Aplikasi',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {},
            ),
          ],
        ),
      ),

      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu, color: AppColors.neon),
            onPressed: () => Scaffold.of(context).openDrawer(), // buka drawer
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: Center(
              child: Text(
                "Your Activities",
                style: TextStyle(
                  color: AppColors.neon,
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 16),
            width: 40,
            height: 40,
            child: FloatingActionButton(
              heroTag: "add_activity_appbar",
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              backgroundColor: AppColors.neon,
              child: const Icon(Icons.add, color: Colors.black, size: 25),
              onPressed: () {
                Get.toNamed(AppRoutes.addWidepage);
              },
            ),
          ),
        ],
      ),

      body: Obx(
        () => ListView(
          padding: const EdgeInsets.symmetric(horizontal: standardPadding),
          children: [
            // JAM
            Padding(
              padding: const EdgeInsets.only(top: 60, bottom: 40),
              child: Center(
                child: Text(
                  DateFormat('hh:mm:ss a').format(timeC.currentTime.value),
                  style: TextStyle(
                    color: AppColors.textLight,
                    fontSize: 40,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.5,
                  ),
                ),
              ),
            ),

            // JIKA TODO LIST KOSONG
            if (homeController.todolist.isEmpty)
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: Text(
                    "You have no activities",
                    style: TextStyle(
                      color: AppColors.neon,
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            else
              // LIST TODO
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
                  child: Card(
                    color: const Color(0xFF444444),
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Judul + kategori
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Flexible(
                                      child: Text(
                                        title,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: AppColors.textLight,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    if (category.isNotEmpty)
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 8,
                                          vertical: 2,
                                        ),
                                        decoration: BoxDecoration(
                                          color: AppColors.neon.withOpacity(
                                            0.15,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            5,
                                          ),
                                        ),
                                        child: Text(
                                          "Category: ${category.toUpperCase()}",
                                          style: TextStyle(
                                            fontSize: 11,
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.neon,
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  description,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: AppColors.textGrey,
                                  ),
                                ),
                                const SizedBox(height: 12),
                                Text(
                                  dueDate != null
                                      ? "Due: ${DateFormat('d MMMM yyyy').format(dueDate)}"
                                      : "Due: No date set",
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: AppColors.textLight,
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 15),
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: isDone
                                  ? AppColors.neon
                                  : Colors.transparent,
                              border: isDone
                                  ? null
                                  : Border.all(color: AppColors.neon, width: 2),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: InkWell(
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
                              child: Center(
                                child: Icon(
                                  Icons.check,
                                  color: isDone ? Colors.black : AppColors.neon,
                                  size: 28,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
          ],
        ),
      ),
    );
  }
}
