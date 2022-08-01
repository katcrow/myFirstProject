import 'package:first_mental_health/core/theme/app_colors.dart';
import 'package:first_mental_health/core/theme/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:typewritertext/typewritertext.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mentalBrandColor,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              CustomText.brand_name_1,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24.0.sp,
                color: AppColors.mentalBrandColor2,
              ),
            ),
            SizedBox(width: 10.0.w),
            TypeWriterText(
              duration: Duration(milliseconds: 300),
              text: Text(
                CustomText.brand_name_2,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0.sp,
                  color: Colors.black45,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
