import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final double? margin;
  final VoidCallback? onPressed;

  const CustomButton({
    super.key,
    required this.text,
    this.margin = 20.0,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: margin ?? 20.0),
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 75, 5, 107),
          foregroundColor: Colors.white,
          elevation: 4,
          shadowColor: Colors.black26,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
