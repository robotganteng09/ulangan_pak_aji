// lib/pages/profille_page.dart

import 'package:flutter/material.dart';
import '../widgets/profile_card.dart';

class Profillepage extends StatelessWidget {
  const Profillepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // page background
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(9.0),
              child: Row(
                children: const [
                  Text(
                    "Profile",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 5),
                  Icon(Icons.check_box, size: 24),
                ],
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: const [
                    ProfileCard(
                      username: "Narendra/20/XI PPLG 2",
                      imagePath: "assets/image/naren.jpg",
                    ),
                    ProfileCard(
                      username: "Arsya/9/IX PPLG 2",
                      imagePath: "assets/image/arsya.jpg",
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
