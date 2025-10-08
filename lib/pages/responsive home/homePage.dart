import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ulangan_pak_aji/controller/home_controller.dart';
import 'package:ulangan_pak_aji/controller/time_controller.dart';
import 'package:ulangan_pak_aji/routes/route.dart';
import 'package:ulangan_pak_aji/widgets/app_colors.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    final homeController = Get.find<HomeController>();
    final timeC = Get.find<TimeController>();

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,

        title: Text(
          "Your Activities",
          style: TextStyle(
            color: AppColors.neon,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed(AppRoutes.History);
            },
            icon: Icon(Icons.history, color: AppColors.neon, size: 28),
            tooltip: 'History',
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Obx(
              () => Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 25,
                ),
                decoration: BoxDecoration(
                  color: Colors.grey[900],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  DateFormat('hh:mm a').format(timeC.currentTime.value),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),

          Expanded(
            child: Container(
              margin: const EdgeInsets.all(5),
              child: Obx(
                () => homeController.todolist.isEmpty
                    ? Center(
                        child: Text(
                          "You have no activities",
                          style: TextStyle(
                            color: AppColors.neon,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.center,
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
                              color: const Color(0xFF444444),
                              margin: const EdgeInsets.symmetric(
                                vertical: 8,
                                horizontal: 16,
                              ),
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                // ⚙️ Border radius lebih besar
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              // ⚙️ Judul
                                              Flexible(
                                                child: Text(
                                                  todo.Title,
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize:
                                                        20, // Ukuran lebih besar
                                                    color: AppColors
                                                        .textLight, // Warna teks putih/terang
                                                  ),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                              // ⚙️ Kategori di kanan atas
                                              Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                      horizontal: 8,
                                                      vertical: 2,
                                                    ),
                                                decoration: BoxDecoration(
                                                  color: AppColors.neon
                                                      .withOpacity(0.15),
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                ),
                                                child: Text(
                                                  "Category: ${todo.category.toUpperCase()}",
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
                                          // ⚙️ Deskripsi
                                          Text(
                                            todo.Description,
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: AppColors.textGrey,
                                            ),
                                          ),
                                          const SizedBox(height: 12),
                                          // ⚙️ Due Date (dengan label "Due")
                                          Text(
                                            todo.dueDate != null
                                                ? "Due: ${DateFormat('d MMMM yyyy').format(todo.dueDate!)}"
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

                                    SizedBox(width: 15),
                                    Container(
                                      width: 40,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        color: todo.isDone
                                            ? AppColors.neon
                                            : Colors.transparent,
                                        border: todo.isDone
                                            ? null
                                            : Border.all(
                                                color: AppColors.neon,
                                                width: 2,
                                              ),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: InkWell(
                                        onTap: () {
                                          homeController.UpdateList(
                                            index,
                                            todo.Title,
                                            todo.Description,
                                            !todo.isDone, // Toggle status
                                            todo.category,
                                            todo.dueDate,
                                          );
                                        },
                                        child: Center(
                                          child: Icon(
                                            Icons.check,
                                            color: todo.isDone
                                                ? Colors
                                                      .black // Teks hitam di atas neon
                                                : AppColors.neon,
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
                        },
                      ),
              ),
            ),
          ),
        ],
      ),

      floatingActionButton: Container(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          backgroundColor: AppColors.neon,

          child: const Icon(Icons.add, color: Colors.black, size: 40),
          onPressed: () {
            Get.toNamed(AppRoutes.Addpage);
          },
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.centerFloat, // Tombol di tengah bawah
    );
  }
}
