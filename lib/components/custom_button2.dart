import 'package:flutter/material.dart';

class CustomButton2 extends StatelessWidget {
  final String? buttonText;
  final Function()? buttonAction;
  const CustomButton2({
    super.key,
    required this.buttonText,
    this.buttonAction,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 48,
      decoration: BoxDecoration(
        color: const Color(0xFFE6F2FF),
        boxShadow: const [
          BoxShadow(
            blurRadius: 0,
            color: Color(0xFFBCDDFE),
            offset: Offset(0, 4),
            spreadRadius: 0,
          )
        ],
        borderRadius: BorderRadius.circular(30),
      ),
      child: Center(
        child: Text(
          buttonText!,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontFamily: 'Inter',
            color: Color(0xFF2F7FCE),
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
