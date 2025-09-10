import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ReuseTextField extends StatelessWidget {
  final String label;
  final double? marginTop;
  final TextEditingController controller;
  final bool? obscureText, readOnly;
  final GestureTapCallback? onTap;
  final bool isNUmber;
  final Color? fillColor;
  final Color? borderColor;
  final Color? textColor;
  final Color? labelColor;

  const ReuseTextField({
    super.key,
    required this.label,
    required this.controller,
    this.obscureText = false,
    this.marginTop,
    this.onTap,
    this.readOnly,
    required this.isNUmber,
    this.fillColor,
    this.borderColor,
    this.textColor,
    this.labelColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: marginTop ?? 12),
      child: TextField(
        controller: controller,
        inputFormatters: isNUmber
            ? [FilteringTextInputFormatter.digitsOnly]
            : [],
        obscureText: obscureText ?? false,
        readOnly: readOnly ?? false,
        onTap: onTap,
        style: TextStyle(color: textColor ?? Colors.black),
        decoration: InputDecoration(
          filled: true,
          fillColor: fillColor ?? Colors.grey[200],
          labelText: label,
          labelStyle: TextStyle(color: labelColor ?? Colors.grey),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: borderColor ?? Colors.grey.shade400),
            borderRadius: BorderRadius.circular(16),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: borderColor ?? Colors.blue, width: 2),
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
    );
  }
}
