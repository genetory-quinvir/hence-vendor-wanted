import 'package:flutter/material.dart';

class CommonProfileView extends StatelessWidget {
  const CommonProfileView({super.key, this.size = 44});

  final double size;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(size / 2),
      ),
    );
  }
}
