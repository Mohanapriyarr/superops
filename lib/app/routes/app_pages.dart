import 'package:get/get.dart';
import 'package:superops/app/module/home_page/home_page_binding.dart';
import 'package:superops/app/module/home_page/home_page_view.dart';
import 'package:superops/app/module/user_details/user_details_binding.dart';
import 'package:superops/app/module/user_details/user_details_controller.dart';
import 'package:superops/app/module/user_details/user_details_view.dart';
import 'package:superops/app/routes/app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
        name: Routes.HOME,
        page: () => const HomePageView(),
        binding: HomePageBinding()),
    GetPage(
        name: Routes.USERDETAILS,
        page: () => const UserDetailsView(),
        binding: UserDetailsBinding())
  ];
}
