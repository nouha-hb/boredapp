import 'package:flutter/material.dart';
import 'package:funapp/routes/app_page.dart';
import 'package:funapp/routes/app_routes.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';


main() async {
  // Initialize hive
  await Hive.initFlutter();
  // Open the peopleBox
  await Hive.openBox('activityBox');
  runApp(GetApp());
}

class GetApp extends StatelessWidget {
  @override
   Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
        initialRoute: Routes.initial,
        defaultTransition: Transition.fade,
        getPages: AppPages.pages,
        enableLog: true,
        opaqueRoute: Get.isOpaqueRouteDefault,
        popGesture: Get.isPopGestureEnable,
    );
  }
  
}
