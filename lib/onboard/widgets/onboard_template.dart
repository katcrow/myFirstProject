import 'package:first_mental_health/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardTemplate extends StatelessWidget {
  // 생성자 넘어오는 인자들
  final PageController pageController;
  final String image; // 대표 이미지 경로
  final String subTitle1;
  final String subTitle2;
  final VoidCallback onPressed; // 버튼 클릭 시 이벤트
  final VoidCallback skipButtonPressed; // 스킵하자는 버튼 , 바로 로그인으로

  const OnboardTemplate({
    Key? key,
    required this.pageController,
    required this.image,
    required this.subTitle1,
    required this.subTitle2,
    required this.onPressed,
    required this.skipButtonPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// 전체는 컬럼으로 이루어져 있으며,
    /// 첫번재 로우 영역은 맨 끝으로 해서 스킵버튼 만든다.
    return Container(
      child: Column(
        children: [
          //-- skip 영역
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              //-- text Button 또는 그냥 텍스트
              Text(
                "Skip",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
          SizedBox(height: 25.0.h),
          //-- 이미지 영역
          Container(
            height: 450.0.h,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 15.0.h),
          //-- dot 영역
          SmoothPageIndicator(
            controller: pageController,
            count: 3,
            effect: WormEffect(
                dotHeight: 10.0.h, dotWidth: 10.0.h, activeDotColor: AppColors.mentalBrandColor),
            onDotClicked: (index) {
              pageController.animateToPage(
                index,
                duration: Duration(milliseconds: 300),
                curve: Curves.easeIn,
              );
            },
          ),
          SizedBox(height: 15.0.h),
          //-- 첫번째 텍스트

          //-- 두번째 텍스트
        ],
      ),
    );
  }
}
