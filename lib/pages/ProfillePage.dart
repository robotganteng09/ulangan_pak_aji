import 'package:flutter/material.dart';
import '../widgets/profile_card.dart';

class Profillepage extends StatelessWidget {
  const Profillepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: const [
                  Text(
                    "Profile",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFccff00),
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(vertical: 8),
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
