import 'package:flutter/material.dart';
import 'package:ulangan_pak_aji/widgets/app_colors.dart';

class ProfileCard extends StatelessWidget {
  final String username;
  final String imagePath;
  final String subtext;

  const ProfileCard({
    super.key,
    required this.username,
    required this.imagePath,
    this.subtext = "kata kta",
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 14),
        child: Container(
          width: 280,
          height: 340,
          decoration: BoxDecoration(
            color: AppColors.background,
            border: Border.all(color: AppColors.neon, width: 1.5),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: AppColors.neon.withOpacity(0.3),
                blurRadius: 12,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Stack(
            children: [
              // Icon checklist kanan atas
              Positioned(
                top: 10,
                right: 10,
                child: Icon(
                  Icons.check_circle,
                  color: AppColors.neon,
                  size: 26,
                ),
              ),

              // Konten tengah
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Avatar
                    Container(
                      alignment: Alignment.center,
                      width: 115,
                      height: 115,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColors.neon, width: 2),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.neon.withOpacity(0.4),
                            blurRadius: 15,
                            spreadRadius: 3,
                          ),
                        ],
                      ),
                      child: ClipOval(
                        child: Image.asset(imagePath, fit: BoxFit.cover),
                      ),
                    ),

                    const SizedBox(height: 18),

                    // Username
                    Text(
                      username,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: AppColors.textLight,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 8),

                    // Subtext
                    Text(
                      subtext,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: AppColors.textGrey,
                        fontSize: 13,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
