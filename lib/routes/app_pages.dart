import 'package:first_mental_health/auth/presentation/auth_login_screen.dart';
import 'package:first_mental_health/launchscreen/presentation/welcome_screen.dart';
// import 'package:first_mental_health/onboard/application/onboard_controller.dart';
import 'package:get/get.dart';
import '../onboard/presentation/onboard_screen.dart';
import 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: INITIAL,
      page: () => WelcomeScreen(),
    ),
    GetPage(
      name: Routes.ONBOARD,
      page: () => OnboardingScreen(),
      // binding: BindingsBuilder(
      //   () {
      //     Get.put(OnboardingController());
      //   },
      // ),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => AuthLoginScreen(),
    ),
  ];
}
