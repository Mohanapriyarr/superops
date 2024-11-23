import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:superops/app/data/resource/color_resource.dart';
import 'package:superops/app/data/resource/constant_resource.dart';
import 'package:superops/app/module/home_page/home_page_controller.dart';
import 'package:superops/app/routes/app_routes.dart';

class HomePageView extends GetView<HomePageController> {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              onError: (error) => Text(error ?? 'Items Empty'),
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

  Widget _mainChild({required BuildContext context}) => Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CROSS_AXIS_CENTER,
          children: [
            _searchBar(context: context),
            SPACING_SMALL_HEIGHT,
            _listViewContainer(context: context)
          ],
        ),
        // color: APP_MAIN_COLOR,
      );

  Widget _listViewContainer({required BuildContext context}) => Expanded(
        child:
            controller.messageList != null && controller.messageList.isNotEmpty
                ? GetBuilder<HomePageController>(
                    id: 'listview',
                    builder: (controller) => ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        controller: controller.scrollController,
                        itemCount: controller.messageList.length,
                        itemBuilder: (context, i) {
                          if (i == controller.messageList.length) {
                            // Show loader at the bottom
                            return const Center(
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Center(
                                  child: CircularProgressIndicator(),
                                ),
                              ),
                            );
                          }
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: _itemView(context: context, i: i),
                          );
                        }),
                  )
                : Center(
                    child: Text(
                      'Item Not Found',
                      style: h3_dark(context),
                    ),
                  ),
      );

  Widget _itemView({required BuildContext context, required int i}) =>
      Container(
        decoration: BoxDecoration(
          border: Border.all(color: APP_LIGHT_GREY),
          borderRadius: BorderRadius.circular(16),
        ),
        child: ListTile(
          leading: GestureDetector(
            onTap: () {
              Get.toNamed(Routes.USERDETAILS, arguments: {
                'image': controller.messageList[i].author.photoUrl,
                'name': controller.messageList[i].author.name ?? 'John Doe',
                'content': controller.messageList[i].content ?? 'John Doe',
                'isFavourite': controller.messageList[i].isFavourite ?? false,
              });
            },
            child: CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(
                  'https://message-list.appspot.com${controller.messageList[i].author.photoUrl}'),
            ),
          ),
          title: Text(
            controller.messageList[i].author.name ?? 'John Doe',
            style: h3_dark(context)?.copyWith(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            '${controller.lastUpdateTime(date: controller.messageList[i].updated)} years ago',
            style: h3_light(context)?.copyWith(fontSize: 12),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onTap: () {
                  if (controller.searchController.text.isEmpty) {
                    controller.messageList[i].isFavourite =
                        !controller.messageList[i].isFavourite;
                  } else {
                    for (var element in controller.messageList) {
                      if (element.id == controller.messageList[i].id) {
                        element.isFavourite = !element.isFavourite;
                      }
                    }
                  }
                  controller.update(['favourite']);
                },
                child: GetBuilder<HomePageController>(
                  id: 'favourite',
                  builder: (controller) => Icon(
                    Icons.favorite,
                    color: controller.messageList[i].isFavourite
                        ? APP_MAIN_COLOR
                        : APP_LIGHT_GREY_OPACITY_2,
                  ),
                ),
              ),
              SPACING_SMALL_WIDTH,
              _commonButton(context: context, i: i, isDelete: false),
            ],
          ),
        ),
      );

  Widget _commonButton(
          {required BuildContext context,
          required int i,
          required bool isDelete}) =>
      GestureDetector(
        onTap: () {
          if (isDelete) {
            controller.messageList.removeAt(i);
            Get.back();
            controller.update(['listview']);
          } else {
            _deleteBtnOnTap(context: context, i: i);
          }
          controller.searchFocusNode.unfocus();
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          decoration: BoxDecoration(
              border: Border.all(color: APP_MAIN_COLOR),
              borderRadius: BorderRadius.circular(16)),
          child: Text(
            'Delete',
            style: h3_dark(context)?.copyWith(color: APP_MAIN_COLOR),
          ),
        ),
      );

  _deleteBtnOnTap({required BuildContext context, required int i}) {
    return showDialog(
        barrierDismissible: true,
        context: context,
        builder: ((context) => AlertDialog(
              clipBehavior: Clip.hardEdge,
              actionsPadding: const EdgeInsets.only(bottom: 24, right: 16),
              title: Text(
                'Delete this author?',
                style: h2_dark(context)?.copyWith(fontWeight: FontWeight.bold),
              ),
              content: ListTile(
                contentPadding: const EdgeInsets.all(0),
                leading: CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(
                      'https://message-list.appspot.com${controller.messageList[i].author.photoUrl}'),
                ),
                title: Text(
                  controller.messageList[i].author.name ?? 'John Doe',
                  style:
                      h3_dark(context)?.copyWith(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  '${controller.lastUpdateTime(date: controller.messageList[i].updated)} years ago',
                  style: h3_light(context)?.copyWith(fontSize: 12),
                ),
              ),
              actions: [
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Text(
                    'Cancel',
                    style: h3_dark(context),
                  ),
                ),
                SPACING_VSMALL_WIDTH,
                _commonButton(context: context, i: i, isDelete: true)
              ],
            )));
  }

  Widget _searchBar({required BuildContext context}) => Container(
        padding: const EdgeInsets.only(left: 8.0, right: 4, top: 4, bottom: 4),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24.0),
            color: APP_LIGHT_GREY_OPACITY_2),
        child: TextFormField(
          focusNode: controller.searchFocusNode,
          controller: controller.searchController,
          style: h3_light(context),
          textInputAction: TextInputAction.search,
          decoration: InputDecoration(
            hintText: 'Search...',
            fillColor: INPUT_FIELD_GREY,
            labelStyle: h3_light(context),
            suffixIcon: IconButton(
              onPressed: () {
                // controller.searchItems(
                //     searchText: controller.searchController.text);
              },
              icon: const Icon(Icons.search),
              color: Colors.grey,
            ),
          ),
          onChanged: (value) => controller.searchItems(
              searchText: controller.searchController.text),
        ),
      );
}
