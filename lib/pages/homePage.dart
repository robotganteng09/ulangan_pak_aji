import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ulangan_pak_aji/controller/home_controller.dart';
import 'package:ulangan_pak_aji/widgets/buttonReusable.dart';
import 'package:ulangan_pak_aji/routes/route.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    final homeController = Get.find<HomeController>();

    return Scaffold(
      appBar: AppBar(title: const Text("Your to do list"), centerTitle: true),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(height: 10),
            Expanded(
              child: Obx(
                () => ListView.builder(
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
                        margin: const EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 8,
                        ),
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                todo.Title,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                todo.Description,
                                style: const TextStyle(fontSize: 16),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                "Category: ${todo.category}",
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                              const SizedBox(height: 12),
                              Row(
                                children: [
                                  const Text("Status: "),
                                  Checkbox(
                                    value: todo.isDone,
                                    onChanged: (value) {
                                      if (value != null) {
                                        homeController.UpdateList(
                                          index,
                                          todo.Title,
                                          todo.Description,
                                          value,
                                        );
                                      }
                                    },
                                  ),
                                  Text(
                                    todo.isDone ? "Selesai" : "Belum Selesai",
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
            CustomButton(
              text: "Add list",
              onPressed: () {
                Get.toNamed(AppRoutes.Addpage);
              },
            ),
          ],
        ),
      ),
    );
  }
}
