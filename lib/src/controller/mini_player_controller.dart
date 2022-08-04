

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/animation.dart';
import 'package:music_app/src/controller/hive_controller.dart';
import 'package:get/get.dart';
import 'package:music_app/src/model/music_data.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
// class MiniPlayerController extends GetxController with GetSingleTickerProviderStateMixin{
class MiniPlayerController extends GetxController with GetSingleTickerProviderStateMixin{
  // final HiveContoller controllerHive = Get.put(HiveContoller());
  AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();
  late AnimationController controllerAnimate;
  static MiniPlayerController get to => Get.find();
  RxInt currentIdx = 0.obs;
  RxBool isPlay = false.obs;
  RxBool isRepeat = false.obs;
  RxBool isShuffle = false.obs;
  final box = Hive.box('musicBox');
  // List<String> list = ['0'];
  RxList<String> list = <String>[].obs;
  String? path;
  final audios = <Audio>[];

  @override
  void onInit() {
    super.onInit();
    controllerAnimate = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 500,
      ),
    );
    onLoadData();
    loadAudio();
  }

  void onLoadData() {
    // box.clear();
    if(box.get('musicList').toString() == null.toString()){
      print('object null');
    }else{
      list( box.get('musicList'));
      list.forEach((element) {
        audios.add(
            Audio(
                totalSongList[int.parse(element)].url,
                metas: Metas(
                  id: element.toString(),
                  title: totalSongList[int.parse(element)].title,
                  artist: totalSongList[int.parse(element)].singer,
                )
            )
        );
      });
    }
  }

  void playRepeat(){
    isRepeat(!isRepeat.value);
  }

  void playShuffle(){
    isShuffle(!isShuffle.value);
  }

  Future loadAudio() async{
    await assetsAudioPlayer.open(
      Playlist(
        audios: audios,
      ),
      loopMode: LoopMode.playlist, //loop the full playlist
      showNotification: true,
      autoStart: false,
      notificationSettings: NotificationSettings(
        stopEnabled: false,
        customNextAction: (player) {
          next();
        },
        customPrevAction: (player){
          pre();
        },
        customPlayPauseAction: (player){
          isPlay(!isPlay.value);
          if (isPlay.value) {
            controllerAnimate.forward();
          } else {
            controllerAnimate.reverse();
          }
          assetsAudioPlayer.playOrPause();
        },
      ),
    );
    assetsAudioPlayer.playlistAudioFinished.listen((Playing playing){
      print("finish ??1111");
      if(isRepeat.value){
        currentIdx(currentIdx.value);
        assetsAudioPlayer.playlistPlayAtIndex(currentIdx.toInt());
      }else{
        assetsAudioPlayer.current.value!.playlist.nextIndex;
        currentIdx(assetsAudioPlayer.current.value!.playlist.nextIndex);
      }
    });
    // print(" result audio 11111===" + assetsAudioPlayer.current.value!.playlist.toString());
  }

  void next(){
    isPlay(true);
    controllerAnimate.forward();
    if(list.length == currentIdx.value+1){
      currentIdx(0);
    }else{
      currentIdx(currentIdx.value + 1);
    }
    if(isPlay.value){
      assetsAudioPlayer.playlistPlayAtIndex(currentIdx.toInt());
    }
  }

  void pre(){
    isPlay(true);
    controllerAnimate.forward();
    if(currentIdx.value == 0){
      currentIdx(list.length-1);
    }else{
      currentIdx(currentIdx.value - 1);
    }
    if(isPlay.value){
      assetsAudioPlayer.playlistPlayAtIndex(currentIdx.toInt());
    }
  }

  playLocal() async {
    print("playt lodcal");
    isPlay(!isPlay.value);
    await assetsAudioPlayer.playOrPause();
  }

  void playInsert(value) async{
    if(list.length == 0){
      print("null" + audios.toString());
      list( box.get('musicList'));
      audios.add(
          Audio(
              totalSongList[int.parse(value)].url,
              metas: Metas(
                id: value.toString(),
                title: totalSongList[int.parse(value)].title,
                artist: totalSongList[int.parse(value)].singer,
              )
          )
      );
      await loadAudio();
      currentIdx(0);
      await assetsAudioPlayer.playlistPlayAtIndex(0);
    }else{
      list( box.get('musicList'));
      audios.insert(0,
          Audio(
              totalSongList[int.parse(value)].url,
              metas: Metas(
                id: value.toString(),
                title: totalSongList[int.parse(value)].title,
                artist: totalSongList[int.parse(value)].singer,
              )
          )
      );
      // assetsAudioPlayer
      await loadAudio();
      currentIdx(0);
      isPlay(true);
      controllerAnimate.forward();
      await assetsAudioPlayer.playlistPlayAtIndex(0);
    }
  }

  void listChange(value){
    currentIdx(value);
    controllerAnimate.forward();
    isPlay(true);
    assetsAudioPlayer.playlistPlayAtIndex(value);
  }

  void deleteList(String value , String index) async {
    // assetsAudioPlayer.stop();
    // isPlay(true);
    // currentIdx(currentIdx.value-1);
    // controllerAnimate.forward();
    // await assetsAudioPlayer.play();
    // await assetsAudioPlayer.playlist!.removeAtIndex(int.parse(index));

    list(box.get('musicList'));
    print('lis===' + list.toString());
    print('list length===' + list.length.toString() + 'index ===' +
        index.toString() + 'currentidx ===' + currentIdx.toString());
    // await assetsAudioPlayer.stop();


    if(list.length ==0){
      await assetsAudioPlayer.stop();
      //
      // assetsAudioPlayer
      // await assetsAudioPlayer.playlist!.removeAtIndex(int.parse(index));
      // await assetsAudioPlayer.dispose();
      // onInit();
      // assetsAudioPlayer.playlist! = null;
      // onInit();
      print(">--< :::::" + assetsAudioPlayer.current.length.toString());
      print('=========0=====' +assetsAudioPlayer.current.value!.playlist.toString());
    }else{
      if(currentIdx.value.toInt() == int.parse(index)){
        if(currentIdx.value.toInt() == list.length.toInt()){
          print('=========1=====' +assetsAudioPlayer.current.value!.playlist.toString());
          currentIdx(0);
        }else{
          print('=========2=====');
          if(currentIdx.value.toInt() ==0){
            print('=========2-1=====');
            currentIdx(0);
          }else{
            print('=========2-2=====');
            currentIdx(currentIdx.value-1);
          }
        }
      }else if(currentIdx.value.toInt() > int.parse(index)){
        print('=========3=====');
        currentIdx(currentIdx.value-1);
      }else if(currentIdx.value.toInt() < int.parse(index)){
        print('=========4=====');
        currentIdx(currentIdx.value);
      }
      assetsAudioPlayer.playlist!.removeAtIndex(int.parse(index));
      print('=========final=====');
    }

    // if (list.length == 0) {
    //   print("=3=");
    //   isPlay(false);
    //   currentIdx(0);
    //   controllerAnimate.reverse();
    //   await assetsAudioPlayer.stop();
    // } else {
    //
    //   if (currentIdx.toString() == index.toString()) {
    //     print("last==" + index.toString());
    //     await assetsAudioPlayer.stop();
    //     await assetsAudioPlayer.playlist!.removeAtIndex(int.parse(index));
    //     currentIdx(currentIdx.value+1);
    //     await assetsAudioPlayer.play();
    //   }
      // else {
      //   print("?11===" + currentIdx.toString());
      //   currentIdx(currentIdx.value);
      //   await assetsAudioPlayer.playlist!.removeAtIndex(int.parse(index));
      //   print("????" + assetsAudioPlayer.current.value.toString());
      //   print("?22==" + currentIdx.toString());
      // }
  }


  void test(){
    box.clear();
  }

}