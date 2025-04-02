import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_my_pharmacist/core/consts/colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color;
  final double width;
  final double height;
  final TextStyle textStyle;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.color = AppColors.accentColor,
    this.width = double.infinity,
    this.height = 50.0,
    this.textStyle = const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 16,
    ),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Text(text, style: textStyle),
      ),
    );
  }
}
