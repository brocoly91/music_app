import 'dart:ffi';

import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:music_app/src/controller/mini_player_controller.dart';
import 'package:music_app/src/controller/navigator_controller.dart';


class HiveContoller extends GetxController{

  static HiveContoller get to => Get.find();
  final MiniPlayerController controller = Get.put(MiniPlayerController());
  final NavigatorController controllerNav = Get.put(NavigatorController());
  final box = Hive.box('musicBox');
  List<String> list = [];
  RxInt indexNum = 0.obs;
  @override
  void onInit() async{
    super.onInit();
    loadData();
  }

  void loadData() async{

    if(box.get('musicList').toString() == null.toString()){
      print("null!!! hive controller");
    }else {
      list = box.get('musicList', defaultValue: []);
    }
    // controller.onLoadData();

  }

  void saveData(String value) async{
    if( list.contains(value)){
      print("result 1==" + list.contains(value).toString());
    }else{
      list.insert(0, value);
      indexNum(int.parse(value));
      List<String> listSet = list.toSet().toList();
      await Hive.box("musicBox").put("musicList", listSet);
      controllerNav.changeRootPageIndex(3);
      // controller.assetsAudioPlayer.playlistAudioFinished;
      controller.playInsert(value);
    }
  }

  void deleteData(String value , String index) async{
    print('lis===' + list.toString());
    list.removeAt(list.indexOf(value));
    List<String> newList  = list.toList();
    await Hive.box("musicBox").put("musicList", newList);
    list = box.get('musicList', defaultValue: []);
    controller.deleteList(value, index);
  }

  void clear() async{
    await box.clear();
    // loadData();
  }



}