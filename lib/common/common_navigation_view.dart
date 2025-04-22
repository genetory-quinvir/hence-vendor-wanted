import 'package:flutter/material.dart';

class CommonNavigationView extends StatelessWidget {
  const CommonNavigationView({super.key, this.leftIcon, this.didTapLeft, this.rightIcon, this.didTapRight, this.title});

  final IconData? leftIcon;
  final VoidCallback? didTapLeft;
  final IconData? rightIcon;
  final VoidCallback? didTapRight;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: Row(
        children: [
          buildButton(leftIcon, didTapLeft),
          const Spacer(),
          if (title != null) Text(title!, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
          const Spacer(),
          buildButton(rightIcon, didTapRight),
        ],
      ),
    );
  }

  Widget buildButton(IconData? icon, VoidCallback? didTap) {
    return icon != null 
              ? IconButton(onPressed: didTap, icon: Icon(icon, size: 24), highlightColor: Colors.transparent, splashColor: Colors.transparent) 
              : SizedBox(width: 48, height: 48);
  }
  
  
}
