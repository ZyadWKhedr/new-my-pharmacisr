import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:new_my_pharmacist/core/consts/colors.dart';
import 'package:new_my_pharmacist/core/routes.dart';

class SignupFooter extends StatelessWidget {
  const SignupFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushReplacement(AppRoutes.login);
      },
      child: Padding(
        padding: EdgeInsets.only(left: 170.w),
        child: Text(
          'Already have an account?',
          style: TextStyle(
            color: AppColors.textSecondaryColor,
            fontSize: 14.sp,
          ),
        ),
      ),
    );
  }
}
