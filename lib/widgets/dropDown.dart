import 'package:flutter/material.dart';

class DropdownReusable<T> extends StatelessWidget {
  final List<T> items; // data untuk dropdown
  final T? value; // nilai yang dipilih
  final String hintText; // teks hint
  final void Function(T?) onChanged; // callback kalau ada perubahan
  final String Function(T) itemLabel; // cara menampilkan teks item

  const DropdownReusable({
    super.key,
    required this.items,
    required this.value,
    required this.onChanged,
    required this.itemLabel,
    this.hintText = "Pilih item",
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      // ✅ hindari crash saat value tidak ada di items
      value: items.contains(value) ? value : null,
      hint: Text(hintText, style: const TextStyle(color: Colors.grey)),
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      ),
      isExpanded: true, // ✅ biar teks tidak terpotong
      dropdownColor: Theme.of(context).cardColor, // optional: sesuaikan tema
      items: items.map((T item) {
        return DropdownMenuItem<T>(value: item, child: Text(itemLabel(item)));
      }).toList(),
      onChanged: onChanged,
    );
  }
}
