import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:superops/app/data/resource/color_resource.dart';
import 'package:superops/app/data/resource/constant_resource.dart';
import 'package:superops/app/module/user_details/user_details_controller.dart';

class UserDetailsView extends GetView<UserDetailsController> {
  const UserDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: APP_MAIN_COLOR,
          ),
          onPressed: () => Get.back(),
        ),
        title: Text(
          'Details',
          style: h3_dark(context)?.copyWith(fontWeight: FontWeight.bold),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 24.0),
            child: Icon(
              Icons.favorite,
              color: controller.isFavourite.value
                  ? APP_MAIN_COLOR
                  : APP_LIGHT_GREY_OPACITY_2,
            ),
          )
        ],
        centerTitle: false,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            controller.obx(
              (state) => _mainChild(context: context),
              onLoading: const Center(
                child: CircularProgressIndicator(
                  color: APP_MAIN_COLOR,
                ),
              ),
              onError: (error) => Text(error ?? 'Items Not Found'),
            ),
            controller.isLoading.value
                ? const Center(
                    child: CircularProgressIndicator(color: APP_MAIN_COLOR))
                : const SizedBox()
          ],
        ),
      ),
    );
  }

  Widget _mainChild({required BuildContext context}) => Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [
          SPACING_MEDIUM_HEIGHT,
          CircleAvatar(
            radius: 70,
            backgroundImage: NetworkImage(
                'https://message-list.appspot.com${controller.imageUrl.value}'),
          ),
          SPACING_SMALL_HEIGHT,
          Text(controller.name.value,
              style: h2_dark(context)?.copyWith(fontWeight: FontWeight.bold)),
          SPACING_SMALL_HEIGHT,
          Text(
            controller.content.value,
            textAlign: TextAlign.center,
            style: h3_dark(context)?.copyWith(fontWeight: FontWeight.bold),
          ),
          SPACING_SMALL_HEIGHT,
        ]),
      );
}
