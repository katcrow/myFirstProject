import 'package:first_mental_health/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardTemplate extends StatelessWidget {
  // 생성자 넘어오는 인자들
  final PageController pageController;
  final String image; // 대표 이미지 경로
  final String subTitle1;
  final String subTitle2;
  final bool isSmallImage;
  final VoidCallback onPressed; // 버튼 클릭 시 이벤트
  final VoidCallback skipButtonPressed; // 스킵하자는 버튼 , 바로 로그인으로

  const OnboardTemplate({
    Key? key,
    required this.pageController,
    required this.image,
    required this.subTitle1,
    required this.subTitle2,
    required this.isSmallImage,
    required this.onPressed,
    required this.skipButtonPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint("controller page : ${isSmallImage}");

    /// 전체는 컬럼으로 이루어져 있으며,
    /// 첫번재 로우 영역은 맨 끝으로 해서 스킵버튼 만든다.
    return Container(
      padding: EdgeInsets.all(18.0.h),
      child: Column(
        children: [
          //-- skip 영역
          GestureDetector(
            onTap: () {
              skipButtonPressed;
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                //-- text Button 또는 그냥 텍스트
                Text(
                  "Skip",
                  style: TextStyle(
                    color: AppColors.mentalBrandColor2,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 25.0.h),
          //-- 이미지 영역
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.5,
            // height: 300.h,
            child: Container(
              height: isSmallImage == true
                  ? MediaQuery.of(context).size.height * 0.5
                  : MediaQuery.of(context).size.height * 0.5,
              // width: pageController.page == 0 ? 150.0.h : 300.h,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          SizedBox(height: 15.0.h),
          //-- dot 영역
          SmoothPageIndicator(
            controller: pageController,
            count: 3,
            effect: WormEffect(
              dotHeight: 10.0.h,
              dotWidth: 10.0.h,
              activeDotColor: AppColors.mentalBrandColor2,
            ),
            onDotClicked: (index) {
              pageController.animateToPage(
                index,
                duration: Duration(milliseconds: 300),
                curve: Curves.easeIn,
              );
            },
          ),
          SizedBox(height: 30.0.h),
          //-- 텍스트
          Padding(
            padding: EdgeInsets.only(right: 150.w),
            child: RichText(
              text: TextSpan(
                text: subTitle1,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0.sp,
                  color: AppColors.mentalBrandColor2,
                  height: 1.5,
                ),
                children: [
                  TextSpan(
                    text: subTitle2,
                    style: TextStyle(
                      fontSize: 20.0.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black45,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 50.h),
          //-- 하단 버튼
          GestureDetector(
            onTap: () {
              onPressed;
            },
            child: Container(
              padding: EdgeInsets.all(15.0.h),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: AppColors.mentalBrandColor2.withOpacity(0.62),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Center(
                child: Text(
                  pageController.page != 2 ? "다음 페이지" : "로그인",
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 16.sp,
                    color: AppColors.mentalBrandLightColor,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
