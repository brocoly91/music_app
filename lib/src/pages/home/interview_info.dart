import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app/src/components/youtube_player.dart';
import 'package:music_app/src/controller/home_controller.dart';

class InterViewInfo extends StatelessWidget {
  InterViewInfo({Key? key}) : super(key: key);

  final HomeController controller = Get.put(HomeController());


  Widget _userInfo(){
    return Container(
      color: Colors.black,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 18,
              backgroundColor: Colors.grey.withOpacity(0.5),
              child:const Icon(
                Icons.person,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              children: [
                Text(
                  controller.interView.value[Get.arguments].name.toString() +
                      ' / ' + controller.interView.value[Get.arguments].age.toString() + '대',
                  style: const TextStyle(color: Colors.white,),
                ),
                Text(
                  controller.interView.value[Get.arguments].job
                      .toString(),
                  style:const TextStyle(color: Colors.white,),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
            // 'controller.interView.value[${Get.arguments}].name'
            controller.interView.value[Get.arguments].name + ' 인터뷰 영상'
            // style: TextStyle(Colors.whit),
            ),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            height: Get.height,
            color: Colors.black,
            child: Column(
              children: [
                AspectRatio(
                  aspectRatio: 16/9,
                  child: YoutubePlayer(
                    vedioUrl: controller.interView.value[Get.arguments].vedioUrl,
                  ),
                ),
                _userInfo(),
                // Expanded(child: Container(),),
                // Expanded(
                //   flex: 2,
                //   child: Container(
                //     child: Center(
                //       child: Text('data'),
                //     ),
                //     color: Colors.redAccent,
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
