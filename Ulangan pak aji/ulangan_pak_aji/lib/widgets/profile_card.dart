import 'package:flutter/material.dart';
import 'package:ulangan_pak_aji/widgets/app_colors.dart';

class ProfileCard extends StatelessWidget {
  final String username;
  final String imagePath;
  final String subtext;
  final bool compact;

  const ProfileCard({
    super.key,
    required this.username,
    required this.imagePath,
    this.subtext = "kata kta",
    this.compact = false,
  });

  @override
  Widget build(BuildContext context) {
    // Jika compact = true → ukuran lebih kecil
    final double cardWidth = compact ? 120 : 240;
    final double cardHeight = compact ? 180 : 300;
    final double avatarSize = compact ? 60 : 95;
    final double fontSize = compact ? 10.5 : 16;
    final double subtextSize = compact ? 9 : 12;

    return Container(
      width: cardWidth,
      height: cardHeight,
      decoration: BoxDecoration(
        color: AppColors.background,
        border: Border.all(color: AppColors.neon, width: 1.2),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppColors.neon.withOpacity(0.25),
            blurRadius: 8,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Stack(
        children: [
          // Icon checklist kanan atas
          Positioned(
            top: 6,
            right: 6,
            child: Icon(
              Icons.check_circle,
              color: AppColors.neon,
              size: compact ? 16 : 22,
            ),
          ),

          // Konten tengah
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Avatar
                Container(
                  width: avatarSize,
                  height: avatarSize,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.neon, width: 1.5),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.neon.withOpacity(0.35),
                        blurRadius: 8,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: ClipOval(
                    child: Image.asset(imagePath, fit: BoxFit.cover),
                  ),
                ),

                SizedBox(height: compact ? 8 : 14),

                // Username
                Text(
                  username,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.textLight,
                    fontSize: fontSize,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),

                SizedBox(height: compact ? 4 : 6),

                // Subtext
                Text(
                  subtext,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.textGrey,
                    fontSize: subtextSize,
                    fontStyle: FontStyle.italic,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
