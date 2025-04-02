import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_my_pharmacist/core/consts/colors.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 30.h, left: 5.w, right: 5.w),
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromRGBO(0, 0, 0, 0.1),
          borderRadius: BorderRadius.circular(60),
        ),
        child: SalomonBottomBar(
          currentIndex: currentIndex,
          onTap: onTap,
          items: [
            SalomonBottomBarItem(
              icon: Icon(Icons.home, size: 28.sp),
              title: Text("Home"),
              selectedColor: AppColors.accentColor,
            ),
            SalomonBottomBarItem(
              icon: Icon(Icons.chat, size: 28.sp),
              title: Text("AI Chat"),
              selectedColor: AppColors.errorColor,
            ),
            SalomonBottomBarItem(
              icon: Icon(Icons.favorite, size: 28.sp),
              title: Text("Favourites"),
              selectedColor: Colors.pink,
            ),
            SalomonBottomBarItem(
              icon: Icon(CupertinoIcons.time, size: 28.sp),
              title: Text("Reminders"),
              selectedColor: Colors.teal,
            ),
          ],
        ),
      ),
    );
  }
}
