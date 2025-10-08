import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
// Asumsi model/controller/route/colors sudah didefinisikan di lokasi ini
import 'package:ulangan_pak_aji/controller/home_controller.dart';
import 'package:ulangan_pak_aji/controller/time_controller.dart';
import 'package:ulangan_pak_aji/routes/route.dart';
import 'package:ulangan_pak_aji/widgets/app_colors.dart';

// Catatan: Asumsikan Anda telah mendefinisikan AppColors, HomeController,
// TimeController, dan AppRoutes.

class HomeWide extends StatelessWidget {
  const HomeWide({super.key});

  @override
  Widget build(BuildContext context) {
    // Ambil controller
    final homeController = Get.find<HomeController>();
    final timeC = Get.find<TimeController>();

    // Padding standar yang digunakan untuk mengamankan elemen dari tepi layar.
    const double standardPadding = 16.0;

    return Scaffold(
      backgroundColor: AppColors.background,

      // --- APPBAR: Meniru Tampilan Gambar ---
      appBar: AppBar(
        automaticallyImplyLeading:
            false, // Penting agar tidak ada tombol 'Back' otomatis
        backgroundColor: AppColors.background,
        elevation: 0,

  
        actions: [
          // Judul "Your Activities"
          Padding(
            padding: const EdgeInsets.only(
              right: 12.0,
            ), // Beri sedikit jarak dengan tombol plus
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
            margin: const EdgeInsets.only(right: standardPadding),
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
                Get.toNamed(AppRoutes.Addpage);
              },
            ),
          ),
        ],
      ),

   
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: standardPadding),
        child: Column(
          children: [

            Padding(
              padding: const EdgeInsets.only(
                top: 80.0,
                bottom: 80.0,
              ),
              child: Center(
                child: Obx(
                  () => Text(
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
            ),

       
            Expanded(
              child: Obx(
                () => homeController.todolist.isEmpty
                    ? Center(
                        child: Text(
                          "You have no activities",
                          style: TextStyle(
                            color: AppColors.neon,
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      )
                    : ListView.builder(
                        // ... (Widget Builder untuk list item akan ditempatkan di sini jika list ada)
                        itemCount: homeController.todolist.length,
                        itemBuilder: (context, index) {
                          final todo = homeController.todolist[index];
                          // Menggunakan card/list item yang sudah ada dari kode sebelumnya
                          return GestureDetector(
                            onTap: () {
                              Get.toNamed(
                                AppRoutes.Editpage,
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Flexible(
                                                child: Text(
                                                  todo.Title,
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20,
                                                    color: AppColors.textLight,
                                                  ),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
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
                                          Text(
                                            todo.Description,
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: AppColors.textGrey,
                                            ),
                                          ),
                                          const SizedBox(height: 12),
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
                                    const SizedBox(width: 15),
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
                                            !todo.isDone,
                                            todo.category,
                                            todo.dueDate,
                                          );
                                        },
                                        child: Center(
                                          child: Icon(
                                            Icons.check,
                                            color: todo.isDone
                                                ? Colors.black
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
          ],
        ),
      ),
    );
  }
}
