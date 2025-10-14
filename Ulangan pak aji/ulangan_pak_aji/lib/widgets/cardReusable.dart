import 'package:flutter/material.dart';

// Asumsikan warna neon dari UI To-Do List
const Color AppColors_neon = Color(0xFFC7FF00);
const Color AppColors_background = Colors.black;
const Color card_color = Color(
  0xFF333333,
); // Warna abu-abu gelap seperti di screenshot
const Color text_light = Colors.white;

class TodoCard extends StatelessWidget {
  final String title;
  final String description;
  final bool isDone;
  final Widget? trailing;
  final VoidCallback? onTap;

  // Tambahkan properti opsional untuk teks tambahan seperti Due Date/Category,
  // karena tampilan To-Do List Anda lebih kompleks dari sekadar Title/Subtitle.
  final Widget? bottomContent;

  const TodoCard({
    super.key,
    required this.title,
    required this.description,
    this.isDone = false,
    this.onTap,
    this.trailing,
    this.bottomContent, // Properti baru
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // Ganti Card dengan Container untuk kontrol penuh
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: card_color,
        borderRadius: BorderRadius.circular(16),
        // Border dibuat tebal dan neon jika isDone, atau border tipis/tidak ada jika tidak.
        // Di gambar To-Do List Anda, kartu tidak memiliki border kecuali yang diceklis.
        border: isDone ? Border.all(color: AppColors_neon, width: 2.0) : null,
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Kolom Utama untuk Title, Description, dan Bottom Content
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: text_light, // Judul berwarna putih
                        fontSize: 20,
                        decoration: isDone ? TextDecoration.lineThrough : null,
                        decorationColor: AppColors_neon,
                        decorationThickness: 2.0,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      description,
                      style: TextStyle(
                        color: Colors.grey.shade400,
                        fontSize: 14,
                        decoration: isDone ? TextDecoration.lineThrough : null,
                        decorationColor: Colors.grey.shade600,
                      ),
                    ),
                    if (bottomContent != null) ...[
                      const SizedBox(height: 8),
                      bottomContent!,
                    ],
                  ],
                ),
              ),

              const SizedBox(width: 16),

              // Trailing (Ikon Checkbox atau Delete)
              if (trailing != null)
                Align(alignment: Alignment.centerRight, child: trailing!),
            ],
          ),
        ),
      ),
    );
  }
}
