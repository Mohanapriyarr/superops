import 'package:get/get.dart';

class UserDetailsController extends GetxController with StateMixin {
  final isLoading = false.obs;

  final imageUrl = ''.obs;
  final name = ''.obs;
  final content = ''.obs;
  final isFavourite = false.obs;

  @override
  void onInit() {
    change(null, status: RxStatus.loading());

    final arg = Get.arguments;
    if (arg != null) {
      imageUrl.value = arg['image'];
      name.value = arg['name'];
      content.value = arg['content'];
      isFavourite.value = arg['isFavourite'];
    }
    change(null, status: RxStatus.success());

    super.onInit();
  }
}
