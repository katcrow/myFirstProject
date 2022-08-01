import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  //--
  late PageController pageController;

  int initPage = 0;

  // page를 활용하려 했으나 안써도 될듯
  RxDouble page = 0.0.obs;

  // cur 와 last를 이용하여 작업
  RxInt curPage = 0.obs;
  RxInt lastPage = 0.obs;

  @override
  void onReady() {
    pageController = PageController(initialPage: initPage);
    curPage.value = initPage;

    super.onReady();
  }

  // init 를 했으니 dispose 도 해주자.
  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }

  /// 3개의 온보드 페이지를 만들기로 했으니
  /// 페이지 넘기는 이벤트와 마지막 페이지에서는 로그인 화면으로 가는 이벤트를 만듬
  void nextPage() {
    if (pageController.page == 2) {
      Get.offAllNamed("/login");
    } else {
      pageController.nextPage(
        duration: Duration(milliseconds: 500),
        curve: Curves.easeIn,
      );
    }
  }

  void nextPage2() {
    if (curPage.value == lastPage.value) {
      Get.offAllNamed("/login");
    } else {
      pageController.nextPage(
        duration: Duration(milliseconds: 500),
        curve: Curves.easeIn,
      );
    }
  }
}
