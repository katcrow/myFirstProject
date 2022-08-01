import 'package:first_mental_health/core/theme/app_colors.dart';
import 'package:first_mental_health/core/theme/custom_text.dart';
import 'package:first_mental_health/onboard/application/onboard_controller.dart';
import 'package:first_mental_health/onboard/widgets/onboard_template.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/theme/app_images.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // pageController
    OnboardingController _controller = Get.put(OnboardingController());

    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.white, AppColors.mentalBrandColor],
              stops: [0.2, 0.9],
            ),
          ),
          child: PageView(
            controller: _controller.pageController,
            onPageChanged: (page) {
              _controller.curPage.value = page;
            },
            children: [
              OnboardTemplate(
                pageController: _controller.pageController,
                image: AppImages.onboardPageImage1,
                subTitle1: CustomText.onboard_page_subtitle1_1,
                subTitle2: CustomText.onboard_page_subtitle2_1,
                isSmallImage: true,
                onPressed: _controller.nextPage2, // 함수를 넘기기때문에 () 는 없이 보낸다.
                skipButtonPressed: ()=> Get.offAllNamed("/login"),
              ),
              OnboardTemplate(
                pageController: _controller.pageController,
                image: AppImages.onboardPageImage2,
                subTitle1: CustomText.onboard_page_subtitle1_1,
                subTitle2: CustomText.onboard_page_subtitle2_1,
                isSmallImage: false,
                onPressed: _controller.nextPage2, // 함수를 넘기기때문에 () 는 없이 보낸다.
                skipButtonPressed: ()=> Get.offAllNamed("/login"),
              ),
              OnboardTemplate(
                pageController: _controller.pageController,
                image: AppImages.onboardPageImage3,
                subTitle1: CustomText.onboard_page_subtitle1_1,
                subTitle2: CustomText.onboard_page_subtitle2_1,
                isSmallImage: false,
                onPressed: _controller.nextPage2, // 함수를 넘기기때문에 () 는 없이 보낸다.
                skipButtonPressed: ()=> Get.offAllNamed("/login"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
