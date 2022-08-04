import 'package:get/get.dart';
import 'package:flutter/material.dart';
enum RouteName { Home, Music , Search}

class NavigatorController extends GetxController{

  static NavigatorController get to => Get.find();
  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  RxBool isCategoryPageOpen = false.obs;
  RxInt rootPageIndex = 0.obs;

  void changeRootPageIndex(int index) {
    // setCategoryPage(false);
    print('??' + index.toString());
    rootPageIndex(index);
  }

  Future<bool> onWillPop() async {
    print('??setCategoryPage' + setCategoryPage.toString());
    setCategoryPage(false);
    return !await navigatorKey.currentState!.maybePop();
  }

  void setCategoryPage(bool ck) {
    isCategoryPageOpen(ck);
  }

  void back() {
    print('back=-==' );
    setCategoryPage(false);
    onWillPop();
  }
}