import 'package:first_mental_health/launchscreen/application/welcome_controller.dart';
import 'package:get/get.dart';

class MainBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put<WelcomeController>(WelcomeController());
  }



}