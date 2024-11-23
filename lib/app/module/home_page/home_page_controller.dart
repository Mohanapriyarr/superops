import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:superops/app/data/model/message_list_model.dart';
import 'package:superops/app/data/repository/message_list_api.dart';

class HomePageController extends GetxController with StateMixin {
  final isLoading = false.obs;
  final isLoadingMore = false.obs;

  TextEditingController searchController = TextEditingController();
  FocusNode searchFocusNode = FocusNode();

  // MessageListModel? messageListModel;
  final messageList = <Message>[].obs;
  final searchList = <Message>[].obs;

  ScrollController scrollController = ScrollController();

  final pageToken = ''.obs;

  @override
  Future<void> onInit() async {
    change(null, status: RxStatus.loading());
    scrollController.addListener(() {
      loadMoreData();
    });
    await apiData();
    change(null, status: RxStatus.success());

    super.onInit();
  }

  Future<void> apiData() async {
    final response = await messageListAPI(pageToken: pageToken.value);
    if (response != null) {
      // messageListModel = response;
      messageList.value.addAll(response.messages);
      searchList.value.addAll(response.messages);
      pageToken.value = response.pageToken;
      update(['listview']);
    }
  }

  Future<void> loadMoreData() async {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      isLoadingMore.value = true;
      await apiData();
      await Future.delayed(Duration(seconds: 2));
      isLoadingMore.value = false;
    }
  }

  void searchItems({required String searchText}) {
    messageList.value = searchList
        .where((element) => element.author.name
            .toLowerCase()
            .contains(searchText.toLowerCase()))
        .toList();
    update(['listview']);
    print('searchRes ${searchList.value}');
  }

  String lastUpdateTime({required String? date}) {
    DateTime? givenDate;
    if (date == null) {
      givenDate = DateTime.now();
    } else {
      givenDate = DateTime.parse(date);
    }
    DateTime currentDate = DateTime.now();

    int yearsDifference = currentDate.year - givenDate.year;

    if (currentDate.month < givenDate.month ||
        (currentDate.month == givenDate.month &&
            currentDate.day < givenDate.day)) {
      yearsDifference--;
    }
    return yearsDifference.toString();
  }
}
