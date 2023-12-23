import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String? buttonText;
  final Future<dynamic> Function()? buttonAction;
  final bool loading;

  const CustomButton({
    super.key,
    required this.buttonText,
    this.buttonAction,
    this.loading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 48,
      decoration: BoxDecoration(
        color: const Color(0xFF2F7FCE),
        boxShadow: const [
          BoxShadow(
            blurRadius: 0,
            color: Color(0xFF235F9A),
            offset: Offset(0, 4),
            spreadRadius: 0,
          )
        ],
        borderRadius: BorderRadius.circular(30),
      ),
      child: Center(
        child: loading
            ? const CircularProgressIndicator(
                strokeWidth: 3,
                color: Colors.white,
              )
            : Text(
                buttonText!,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: 'Inter',
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
      ),
    );
  }
}
