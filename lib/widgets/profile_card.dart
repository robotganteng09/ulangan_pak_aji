import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  final String username;
  final String imagePath;
  final String subtext;

  const ProfileCard({
    super.key,
    required this.username,
    required this.imagePath,
    this.subtext = "kata kta"
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 14),
        child: ClipPath(
          clipper: BannerClipper(),
          child: Container(
            width: 280,
            height: 340,
            decoration: BoxDecoration(
              color: Colors.black,
              border: Border.all(color: const Color(0xFFccff00), width: 1.5),
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFFccff00).withOpacity(0.3),
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
                    color: const Color(0xFFccff00),
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
                          border: Border.all(
                            color: const Color(0xFFccff00),
                            width: 2,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFFccff00).withOpacity(0.4),
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
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 8),

                      // Subtext
                      Text(
                        subtext,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white70,
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
      ),
    );
  }
}

class BannerClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double radius = 16.0;
    Path path = Path()
      ..moveTo(0, radius)
      ..quadraticBezierTo(0, 0, radius, 0)
      ..lineTo(size.width - radius, 0)
      ..quadraticBezierTo(size.width, 0, size.width, radius)
      ..lineTo(size.width, size.height - 45)
      ..lineTo(size.width / 2, size.height)
      ..lineTo(0, size.height - 45)
      ..lineTo(0, radius);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
