import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_my_pharmacist/core/consts/colors.dart';

class CustomRow extends StatelessWidget {
  const CustomRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {},
          child: Text(
            'Forgot password?',
            style: TextStyle(
              color: AppColors.textSecondaryColor,
              fontSize: 12.sp,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
        SizedBox(width: 120.w),
        GestureDetector(
          onTap: () {},
          child: Text(
            'Have an account?',
            style: TextStyle(
              color: AppColors.textSecondaryColor,
              fontSize: 14.sp,
            ),
          ),
        ),
      ],
    );
  }
}
