import 'package:first_mental_health/launchscreen/application/welcome_controller.dart';
import 'package:first_mental_health/onboard/application/onboard_controller.dart';
import 'package:get/get.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() async {

    await initializeFirebase();

    Get.put<WelcomeController>(WelcomeController());
    Get.put<OnboardingController>(OnboardingController());

    // Get.lazyPut<OnboardingController>(()=>OnboardingController(), fenix: true);
  }

  Future initializeFirebase() async {
    // Get.lazyPut<OnboardingController>(()=>OnboardingController(), fenix: true);
  }
}
