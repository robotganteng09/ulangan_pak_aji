import 'package:flutter/material.dart';

class DropdownReusable<T> extends StatelessWidget {
  final List<T> items; // data untuk dropdown
  final T? value; // index
  final String hintText;
  final void Function(T?) onChanged; // callback ada perubahan
  final String Function(T) itemLabel; //  menampil item

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
      value: value,
      hint: Text(hintText),
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      ),
      items: items.map((T item) {
        return DropdownMenuItem<T>(value: item, child: Text(itemLabel(item)));
      }).toList(),
      onChanged: onChanged,
    );
  }
}
