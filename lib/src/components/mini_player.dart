import 'package:flip_card/flip_card.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:assets_audio_player/src/playing.dart';
import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:music_app/src/app.dart';
import 'package:music_app/src/controller/mini_player_controller.dart';
import 'package:music_app/src/controller/navigator_controller.dart';
import 'package:music_app/src/model/music_data.dart';
import 'package:music_app/src/pages/MyList/mylist.dart';
import 'package:music_app/src/pages/home/home.dart';

class MiniPlayer extends GetView<MiniPlayerController> {
  MiniPlayer({Key? key}) : super(key: key);

  final MiniPlayerController controller = Get.put(MiniPlayerController());

  final NavigatorController controllerNav = Get.put(NavigatorController());

  Widget _frontCardLayer() {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          "assets/${totalSongList[int.parse(controller.list[controller.currentIdx.value])].image}",
          fit: BoxFit.fill
        ),
      ],
    );
  }

  Widget _backCardLayer() {
    return Stack(
      fit: StackFit.expand,
      children: [
        Opacity(
          opacity: 0.3,
          child: Image.asset(
            "assets/${totalSongList[int.parse(controller.list[controller.currentIdx.value])].image}",
            fit: BoxFit.fitHeight,
            // fit: BoxFit.cover,
            // width: 20,
            // height: 20,
          ),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(0, 60, 0, 10),
          alignment: Alignment.center,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Text(
                  '가사',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: 10,),
                Text(
                  totalSongList[int.parse(controller.list[controller.currentIdx.value])].lyic.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // https://www.urbanbrush.net/web/wp-content/uploads/edd/2021/06/urbanbrush-20210611102855770634.jpg
  Widget _topLayer(context) {
    return GestureDetector(
      onTap: () {
        print("---");
      },
      child: Container(
        // alignment: Alignment.topLeft,
        color: Colors.black,
        width: Get.width,
        height: Get.height / 1.8,
        // child: Center(
        //   child: FlutterLogo(
        //     size: 200,
        //   )
        // ),
        // child: CachedNetworkImage(
        //   alignment: Alignment.topLeft,
        //   fit: BoxFit.cover,
        //   imageUrl: mostPopular[controller.currentIdx.value].image,
        // ),
        child: FlipCard(
          front: _frontCardLayer(),
          back: _backCardLayer(),
        ),
      ),
    );
  }

  Widget _showDurationLayer() {
    return Builder(builder: (context) {
      return controller.assetsAudioPlayer.builderCurrentPosition(
          builder: (context, duration) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                  thumbShape: RoundSliderThumbShape(enabledThumbRadius: 8),
                  trackShape: RectangularSliderTrackShape(),
                  trackHeight: 6),
              child: Slider(
                value: duration.inSeconds.toDouble(),
                max: controller
                    .assetsAudioPlayer.current.value!.audio.duration.inSeconds
                    .toDouble(),
                min: 0,
                inactiveColor: Colors.white54,
                activeColor: Colors.pink,
                onChanged: (double value) {
                  if (!controller.isPlay.value) {
                    controller.assetsAudioPlayer
                        .seek(Duration(seconds: value.toInt()));
                    // controller.playLocal();
                    controller.assetsAudioPlayer.play();
                    controller.assetsAudioPlayer.pause();
                  } else {
                    controller.assetsAudioPlayer
                        .seek(Duration(seconds: value.toInt()));
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    Duration(
                            seconds: controller.assetsAudioPlayer
                                .currentPosition.value.inSeconds)
                        .toString()
                        .split('.')[0]
                        .substring(2),
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    Duration(
                            seconds: controller.assetsAudioPlayer.current.value!
                                .audio.duration.inSeconds)
                        .toString()
                        .split('.')[0]
                        .substring(2),
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
          ],
        );
      });
    });
  }

  Widget _showSongInfoLayer() {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Text(
            totalSongList[int.parse(controller.list[controller.currentIdx.value])].title,
            style: TextStyle(
                color: Colors.white, fontSize: 27, fontWeight: FontWeight.bold),
          ),
          Text(
            totalSongList[int.parse(controller.list[controller.currentIdx.value])].singer,
            style: TextStyle(color: Colors.white, fontSize: 17),
          ),
        ],
      ),
    );
  }

  Widget _showPlayerLayer() {
    return Expanded(
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {
                controller.playRepeat();
              },
              icon: controller.isRepeat.value
                  ? const Icon(
                      Icons.repeat_one,
                      color: Colors.red,
                      size: 35,
                    )
                  : const Icon(
                      Icons.repeat,
                      color: Colors.white,
                      size: 35,
                    ),
            ),
            IconButton(
              onPressed: () {
                controller.pre();
              },
              icon: Icon(
                Icons.skip_previous,
                color: Colors.white,
                size: 35,
              ),
            ),
            GestureDetector(
              onTap: () {
                if (!controller.isPlay.value) {
                  controller.controllerAnimate.forward();
                } else {
                  controller.controllerAnimate.reverse();
                }
                controller.playLocal();
              },
              child: AnimatedIcon(
                // icon: controller.isPlay.value ? AnimatedIcons.pause_play :AnimatedIcons.play_pause,
                icon: AnimatedIcons.play_pause,
                size: 35,
                color: Colors.white,
                progress: controller.controllerAnimate,
              ),
            ),
            IconButton(
              onPressed: () {
                controller.next();
              },
              icon: Icon(
                Icons.skip_next,
                color: Colors.white,
                size: 35,
              ),
            ),
            IconButton(
              onPressed: () {
                if (!controller.isRepeat.value) {
                  controller.playShuffle();
                }
              },
              icon: controller.isShuffle.value
                  ? const Icon(
                      Icons.shuffle,
                      color: Colors.red,
                      size: 35,
                    )
                  : const Icon(
                      Icons.shuffle,
                      color: Colors.white,
                      size: 35,
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _showBottomLayer(context) {
    return Expanded(
      child: Container(
        color: Colors.black,
        alignment: Alignment.bottomRight,
        child: IconButton(
          onPressed: () {
            // controller.next();
            Navigator.pop(context);
            controllerNav.changeRootPageIndex(3);
          },
          icon: Icon(
            Icons.list,
            color: Colors.white,
            size: 35,
          ),
        ),
      ),
    );
  }

  Future _dragBottomSheet(context) {
    return showModalBottomSheet(
        backgroundColor: Colors.black,
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return Obx(
            () => Hero(
              tag: "ppopMiniPlayer",
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _topLayer(context),
                  _showDurationLayer(),
                  _showSongInfoLayer(),
                  _showPlayerLayer(),
                  _showBottomLayer(context),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Dismissible(
        key: Key(controller.currentIdx.value.toString()),
        confirmDismiss: (direction) async {
          if (direction == DismissDirection.startToEnd) {
            // controller.controllerAnimate.forward();
            controller.pre();
          } else if (direction == DismissDirection.endToStart) {
            // controller.controllerAnimate.forward();
            controller.next();
          } else {
            print("else");
          }
        },
        child: GestureDetector(
          onVerticalDragStart: (details) {
            if(controller.list.length>0){
              _dragBottomSheet(context);
            }
          },
          onTap: () {
            if(controller.list.length>0){
              _dragBottomSheet(context);
            }
          },
          child: AnimatedContainer(
            duration: Duration(milliseconds: 500),
            color: Colors.blueGrey[800],
            width: Get.width,
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                controller.list.length > 0
                ?
                Image.asset(
                  "assets/${totalSongList[int.parse(controller.list[controller.currentIdx.value])].image}",
                  fit: BoxFit.cover,
                )
                :
                Container(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      controller.list.length > 0
                      ?
                      totalSongList[int.parse(controller.list[controller.currentIdx.value])].title.toString()
                      :
                      '재생목록이 존재하지 않습니다.',
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      controller.list.length > 0
                          ?
                      totalSongList[int.parse(controller.list[controller.currentIdx.value])].singer.toString()
                          :
                      '재생목록에 곡을 담아주세요!',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        // controller.isPlay(!controller.isPlay.value);
                        if (!controller.isPlay.value) {
                          controller.controllerAnimate.forward();
                        } else {
                          controller.controllerAnimate.reverse();
                        }
                        controller.playLocal();
                      },
                      child:
                      controller.list.length > 0 ?
                      AnimatedIcon(
                        icon: AnimatedIcons.play_pause,
                        size: 30,
                        color: Colors.white,
                        progress: controller.controllerAnimate,
                      )
                      :
                      Container(),
                    ),
                    SizedBox(width: 25,),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
