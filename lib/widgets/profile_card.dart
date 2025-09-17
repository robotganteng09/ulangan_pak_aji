import 'package:flutter/material.dart';
import 'app_colors.dart'; // pastikan file AppColors dipanggil

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
        margin: const EdgeInsets.symmetric(vertical: 16),
        child: ClipPath(
          clipper: BannerClipper(),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
            width: 280,
            height: 340,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [AppColors.background, Color(0xFF111111)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              border: Border.all(color: AppColors.neon, width: 1.8),
              borderRadius: BorderRadius.circular(18),
              boxShadow: [
                BoxShadow(
                  color: AppColors.neon.withOpacity(0.45),
                  blurRadius: 18,
                  spreadRadius: 3,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Stack(
              children: [
                // Icon checklist (kanan atas)
                Positioned(
                  top: 12,
                  right: 12,
                  child: Icon(
                    Icons.verified_rounded,
                    color: AppColors.neon,
                    size: 28,
                  ),
                ),

                // Konten utama
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Avatar
                      Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: AppColors.neon, width: 2),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.neon.withOpacity(0.4),
                              blurRadius: 20,
                              spreadRadius: 4,
                            ),
                          ],
                        ),
                        child: ClipOval(
                          child: Image.asset(imagePath, fit: BoxFit.cover),
                        ),
                      ),

                      const SizedBox(height: 20),

                      // Username
                      Text(
                        username,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: AppColors.textLight,
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.5,
                        ),
                      ),

                      const SizedBox(height: 10),

                      // Subtext
                      Text(
                        subtext,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: AppColors.textGrey,
                          fontSize: 14,
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
      ),
    );
  }
}

class BannerClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double radius = 18.0;
    Path path = Path()
      ..moveTo(0, radius)
      ..quadraticBezierTo(0, 0, radius, 0)
      ..lineTo(size.width - radius, 0)
      ..quadraticBezierTo(size.width, 0, size.width, radius)
      ..lineTo(size.width, size.height - radius)
      ..quadraticBezierTo(
        size.width,
        size.height,
        size.width - radius,
        size.height,
      )
      ..lineTo(radius, size.height)
      ..quadraticBezierTo(0, size.height, 0, size.height - radius)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
