import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_my_pharmacist/core/consts/colors.dart';
import 'package:new_my_pharmacist/features/home/presentation/providers/health_tip_provider.dart';
import 'package:new_my_pharmacist/features/home/presentation/widgets/article_slider.dart';
import 'package:new_my_pharmacist/features/home/presentation/widgets/health_tip_card.dart';
import 'package:new_my_pharmacist/features/home/presentation/widgets/quick_access_grid.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Pharmacist',
          style: TextStyle(
            color: AppColors.primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 20.sp,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppColors.backgroundColor,
        iconTheme: IconThemeData(color: AppColors.primaryColor),
      ),
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header section
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Health Articles',
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.h),

            // Article Carousel
            const ArticleCarousel(),

            SizedBox(height: 30.h),
            _buildSectionHeader('Health Tips'),
            _buildHealthTipsSection(),

            SizedBox(height: 30.h),
            _buildSectionHeader('Quick Access'),
            const QuickAccessGrid(),

            // Bottom padding
            SizedBox(height: 80.h),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHealthTipsSection() {
    return Consumer(
      builder: (context, ref, child) {
        final dailyTipsAsync = ref.watch(randomHealthTipsProvider);

        return SizedBox(
          height: 120.h,
          child: dailyTipsAsync.when(
            loading:
                () => Center(
                  child: CircularProgressIndicator(
                    color: AppColors.accentColor,
                  ),
                ),
            error:
                (error, stack) => Center(
                  child: Text(
                    'Error loading tips',
                    style: TextStyle(
                      color: AppColors.errorColor,
                      fontSize: 14.sp,
                    ),
                  ),
                ),
            data:
                (tips) => ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  itemCount: tips.length,
                  itemBuilder:
                      (context, index) => HealthTipCard(tip: tips[index]),
                ),
          ),
        );
      },
    );
  }
}
