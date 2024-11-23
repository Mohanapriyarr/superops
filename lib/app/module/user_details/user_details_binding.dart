import 'package:get/get.dart';
import 'package:superops/app/module/user_details/user_details_controller.dart';

class UserDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UserDetailsController());
  }
}
