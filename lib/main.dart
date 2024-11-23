import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:superops/app/data/theme/themes.dart';
import 'package:superops/app/routes/app_pages.dart';
import 'package:superops/app/routes/app_routes.dart';

void main() {
  runApp(GetMaterialApp(
    initialRoute: AppPages.INITIAL,
    getPages: AppPages.routes,
    debugShowCheckedModeBanner: false,
    theme: Themes.light,
  ));
}
