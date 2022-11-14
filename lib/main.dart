import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import '/app/controllers/global_controller.dart';
import '/app/modules/auth/controllers/auth_controller.dart';
import '/app/modules/complaint/controllers/complaint_controller.dart';
import '/app/modules/home/views/home_view.dart';

import 'app/routes/app_pages.dart';
import 'app/theme/theme_data.dart';
import 'domain/utils/screen_sizes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put(ComplaintController());
  Get.put(GlobalController());
  Get.put(AuthController());

  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (context, constraints) => ScreenUtilInit(
          builder: (context, child) => GetMaterialApp(
            theme: lightThemeStyle,
            title: 'WiFi Complaint',
            // initialBinding: ControllersBinding(),
            home: const HomeView(),
            defaultTransition: Transition.fadeIn,
            getPages: AppPages.routes,
            debugShowCheckedModeBanner: false,
          ),
          designSize: ScreenSizes(constraints: constraints).getScreenSize(),
        ),
      );
}
