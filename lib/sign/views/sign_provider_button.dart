import 'package:flutter/material.dart';
import '../sign_provider_view.dart';

class SignProviderButton extends StatelessWidget {
  const SignProviderButton({super.key, required this.type, this.didTap});

  final SignProviderType type;
  final Function(SignProviderType)? didTap; 
  
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        onTap: () => didTap?.call(type),
        child: Container(
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey[200]!),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(type.title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),),
            ],
          ),
        ),
      )
    );
  }
} 