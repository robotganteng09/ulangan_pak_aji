import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ReuseTextField extends StatelessWidget {
  final String label;
  final double? marginTop;
  final TextEditingController controller;
  final bool? obscureText, readOnly;
  final GestureTapCallback? onTap;
  final bool isNUmber;

  const ReuseTextField({
    super.key,
    required this.label,
    required this.controller,
    this.obscureText = false,
    this.marginTop,
    this.onTap,
    this.readOnly,
    required this.isNUmber,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: marginTop ?? 12),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 240, 239, 239),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 4)),
        ],
      ),
      child: TextField(
        controller: controller,
        inputFormatters: isNUmber
            ? [FilteringTextInputFormatter.digitsOnly]
            : [],
        obscureText: obscureText ?? false,
        readOnly: readOnly ?? false,
        onTap: onTap,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 18,
          ),
          labelText: label,
          labelStyle: TextStyle(color: Colors.grey[700]),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(16),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xFF1976D2), width: 2),
            borderRadius: BorderRadius.circular(16),
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
        ),
      ),
    );
  }
}
