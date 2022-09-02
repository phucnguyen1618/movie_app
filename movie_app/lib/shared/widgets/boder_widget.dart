import 'package:flutter/material.dart';

class BorderWidget extends StatelessWidget {
  
  final String nameCategory;

  const BorderWidget({
    Key? key,
    required this.nameCategory,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.0),
        color: const Color(0xFFDBE3FF),
      ),
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 12.0),
      child: Text(
        nameCategory,
        style: const TextStyle(
          fontSize: 8.0,
          fontWeight: FontWeight.bold,
          color: Color(0xFF88A4E8),
        ),
      ),
    );
  }
}
