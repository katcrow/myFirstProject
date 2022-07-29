import 'package:first_mental_health/binding/main_binding.dart';
import 'package:first_mental_health/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'launchscreen/presentation/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(411, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => GetMaterialApp(
        initialBinding: MainBinding(),
        debugShowCheckedModeBanner: false,
        title: 'My First Project',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: "NotoSansKR",
        ),
        themeMode: ThemeMode.system,
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
        home: WelcomeScreen(),
      ),
    );
  }
}
