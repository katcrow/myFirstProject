import 'package:first_mental_health/core/theme/app_colors.dart';
import 'package:first_mental_health/onboard/application/onboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // pageController
    // OnboardingController _controller = Get.put(OnboardingController());

    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.white, AppColors.mentalBrandColor],
                  stops: [0.2, 0.9])),
          child: Container(
            padding: EdgeInsets.all(18.0.h),
            child: Column(
              children: [
                //-- skip 영역
                GestureDetector(
                  onTap: () {
                    Get.offAllNamed("/login");
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
                  height: 400.h,
                  child: Container(
                    height: 150.0.h,
                    width: 150.0.h,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/logo.png"),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15.0.h),
                //-- dot 영역
                SmoothPageIndicator(
                  controller: Get.find<OnboardingController>().pageController,
                  count: 1,
                  effect: WormEffect(
                      dotHeight: 10.0.h,
                      dotWidth: 10.0.h,
                      activeDotColor: AppColors.mentalBrandColor),
                  onDotClicked: (index) {
                    Get.find<OnboardingController>().pageController.animateToPage(
                          index,
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeIn,
                        );
                  },
                ),
                SizedBox(height: 15.0.h),
                //-- 첫번째 텍스트
                Padding(
                  padding: EdgeInsets.only(right: 150.w),
                  child: RichText(
                    text: TextSpan(
                      text: "가장 가까운 당신의 친구",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0.sp,
                        color: Colors.blueAccent,
                        height: 1.5,
                      ),
                      children: [
                        TextSpan(
                          text: "  언제나 곁에 있습니다.",
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
                SizedBox(height: 150.h),
                //-- 버튼
                GestureDetector(
                  onTap: (){
                    Get.offAllNamed("/login");
                  },
                  child: Container(
                    padding: EdgeInsets.all(15.0.h),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: AppColors.mentalBrandColor2.withOpacity(0.62),
                    ),
                    child: Center(child: Text("다음 페이지", style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 16.sp,
                      color: AppColors.mentalBrandLightColor,
                    ),)),
                  ),
                )
              ],
            ),
          ),

          // child: PageView(
          //   //-- 페이지 컨트롤러가 필요함:해당페이지 정보를 알아야 함
          //   // onboard 컨트롤러를 만들자
          //   // controller: _controller.pageController,
          //   controller: Get.find<OnboardingController>().pageController,
          //   children: [
          //     //-- 첫번째 페이지 , stl 위젯을 하나 만들어서 공통으로 사용하자
          //
          //     //-- 두번째 페이지
          //
          //     //-- 세번째 페이지
          //   ],
          // ),
        ),
      ),
    );
  }
}
