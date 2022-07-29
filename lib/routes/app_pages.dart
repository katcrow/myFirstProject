import 'package:first_mental_health/launchscreen/presentation/welcome_screen.dart';
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
    ),
  ];
}


