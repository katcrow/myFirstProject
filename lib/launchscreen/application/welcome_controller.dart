import 'package:get/get.dart';
import '../../routes/app_routes.dart';

class WelcomeController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _departWelcome();
  }

  //-- 런치 화면에 일정 시간 지나면 자동으로 온보드 화면으로 라우팅해주는 기능
  //-- 일정시간동안 잡아둬야 하기 때문에 async 처리 해야한다.
  void _departWelcome() async {
    await Future.delayed(Duration(seconds: 5));
    //-- 5초 뒤 온보드 화면으로 라우팅한다.
    Get.offAllNamed(Routes.ONBOARD);
  }
}
