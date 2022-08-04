import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app/src/controller/home_controller.dart';
import 'package:music_app/src/controller/mini_player_controller.dart';

class HomeDetail extends GetView<HomeController> {
  HomeDetail({Key? key}) : super(key: key);

  final HomeController controller = Get.put(HomeController());
  final MiniPlayerController controllerMini = Get.put(MiniPlayerController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.black,
          // appBar: AppBar(
          //   title: const Text('Test CustomScrollView'),
          // ),
          body: CustomScrollView(
            slivers:[
              const SliverAppBar(
                backgroundColor: Colors.black,
                // automaticallyImplyLeading: false,
                // pinned: true,
                floating: true,
                snap: true,
                expandedHeight: 50.0,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  collapseMode: CollapseMode.pin,
                  title: Text('PPOP Inter view'),
                  // background: FlutterLogo(),
                ),
              ),
              SliverFixedExtentList(
                itemExtent: Get.height / 3,
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap : (){
                              controllerMini.assetsAudioPlayer.pause();
                              controllerMini.isPlay.value = false;
                              controllerMini.controllerAnimate.reverse();
                              Get.toNamed('/interviewInfo' , arguments: index);
                            },
                            child: CachedNetworkImage(
                                fit: BoxFit.fill,
                                progressIndicatorBuilder: (context, url, progress) =>
                                    Center(
                                      child: CircularProgressIndicator(
                                        color: Colors.white70,
                                        value: progress.progress,
                                      ),
                                    ),
                                imageUrl:
                                    controller.interView.value[index].url.toString()
                                // controller.interView,
                                //  imageUrl :   'https://i.ytimg.com/vi/qx64rkEDMHY/hqdefault.jpg?sqp=-oaymwEjCNACELwBSFryq4qpAxUIARUAAAAAGAElAADIQj0AgKJDeAE=&rs=AOn4CLALsJftiloAAjt8Ym5w85QAjPkIPQ',
                                ),
                          ),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.grey.withOpacity(0.5),
                              child: Icon(
                                Icons.person,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              children: [
                                Text(
                                  controller.interView.value[index].name
                                          .toString() +
                                      ' / ' +
                                      controller.interView.value[index].age
                                          .toString() +
                                      '대',
                                  style: TextStyle(color: Colors.white,),
                                ),
                                Text(
                                  controller.interView.value[index].job
                                      .toString(),
                                  style: TextStyle(color: Colors.white,),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Divider(
                          color: Colors.white,
                        ),
                      ],
                    );
                  },
                  childCount: controller.interView.length,
                ),
              ),
            ],
          )),
    );
  }
}
