import 'package:get/get.dart';
import 'package:music_app/src/model/home.dart';
import 'package:music_app/src/repository/home_repository.dart';
import 'package:flutter/material.dart';

class HomeController extends GetxController{

  static HomeController get to => Get.find();
  final _homeRepository = HomeRepository();
  RxList<InterView> interView = <InterView>[].obs;



  @override
  void onInit() {
    // TODO: implement onInit
    LoadInterView();
    super.onInit();
  }



  void LoadInterView() async{
    var test = await _homeRepository.loadInterView();
    interView(test);
  }


  // Future<List<InterView>> loadInterView() async{
  //   List<InterView> interView2 = await _homeRepository.loadInterView();
  //   return interView2;
  // }

}