import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_my_pharmacist/core/consts/colors.dart';
import 'package:new_my_pharmacist/features/medicines/domain/entities/medicine.dart';
import 'package:new_my_pharmacist/features/medicines/presentation/providers/medicine_provider.dart';
import 'package:new_my_pharmacist/features/medicines/presentation/widgets/custom_button.dart';

class MedicineDetailsPage extends ConsumerWidget {
  final Medicine medicine;
  const MedicineDetailsPage({super.key, required this.medicine});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(medicine.name, style: TextStyle(fontSize: 22.sp)),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0.w),
        child: Column(
          children: [
            Stack(
              children: [
                Image.network(
                  medicine.imageUrl,
                  height: 150.h,
                  errorBuilder:
                      (context, error, stackTrace) =>
                          const Icon(Icons.broken_image, size: 150),
                ),
                Positioned(
                  top: 8.h,
                  right: 8.w,
                  child: GestureDetector(
                    onTap: () {
                      ref
                          .read(medicineRepositoryProvider)
                          .addToFavorites(medicine);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Added to favorites')),
                      );
                    },
                    child: Icon(
                      Icons.favorite_border,
                      color: AppColors.primaryColor,
                      size: 30.sp,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            Text(
              medicine.uses,
              style: TextStyle(
                fontSize: 18.sp, // Increased font size for better readability
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              "Composition: ${medicine.composition}",
              style: TextStyle(fontSize: 16.sp),
            ),
            Text(
              "Side Effects: ${medicine.sideEffects}",
              style: TextStyle(fontSize: 16.sp),
            ),
            Text(
              "Manufacturer: ${medicine.manufacturer}",
              style: TextStyle(fontSize: 16.sp),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomButton(
                  label: 'Remind Me',
                  icon: Icons.alarm,
                  onPressed: () {
                    final time = TimeOfDay.now().format(
                      context,
                    ); // example time
                    ref
                        .read(medicineRepositoryProvider)
                        .addReminder(medicine.name, time);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Reminder added')),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
