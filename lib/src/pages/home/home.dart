import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:music_app/src/components/banner.dart';
import 'package:music_app/src/controller/home_controller.dart';
import 'package:music_app/src/controller/mini_player_controller.dart';
import 'package:music_app/src/controller/navigator_controller.dart';
import 'package:music_app/src/pages/home/home_detail.dart';
import 'package:music_app/src/pages/home/req_page.dart';
import '../../model/home.dart';

final List<String> imgList = [
  'https://play-lh.googleusercontent.com/9r8DijSKJy3vRLqspACCiqENr12wZ6iKPRNmqpbVYfXvZTI9SsyTKAnYVRPQEguz9A=w5120-h2880-rw',
  'https://play-lh.googleusercontent.com/miJFgA5s2DXp4IDGlK1MRboxVrxWCyZv7z7rETxDYYMsnqdGhxsI1O4Di5DAq2ozSbf8=w5120-h2880-rw',
  'https://play-lh.googleusercontent.com/asgu5yIXCMJb9yPt39NzJ-t3BQEa5CoyI-EHPMeATzULwAZuWXmXLrIIPBM93JyNzMCY=w526-h296-rw',
  'https://play-lh.googleusercontent.com/KDpzhZGJEhSI_qAZwMBNYgZqEbBWjC64ts12t_CVmvjHJbBBeqtOjK1slAxqGmHll5T5=w526-h296-rw',
  'https://play-lh.googleusercontent.com/_WE7m2fwBOCKcc7Q84pPhRCa_T7vodO5ewB1qAD1xwb3wa2l_mO2T_cj1L2vaRfOMJMt=w526-h296-rw',
  'https://play-lh.googleusercontent.com/8MSCQ-JEkghbAC0fobvQ_rJi39uh-Ah4V7snT0Dt86nBmoakDFh9BkHWOn2QbNFMeQ=w526-h296-rw'
];

final List<String> imgListReq = [
  'https://cdn.imweb.me/thumbnail/20200325/fdad57fcf0edb.jpg',
  'https://cdn.imweb.me/thumbnail/20200325/877fa615b97f6.jpg',
  'https://cdn.imweb.me/thumbnail/20200325/013e801d043dc.jpg',
];

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  final HomeController controller = Get.put(HomeController());
  final MiniPlayerController controllerMini = Get.put(MiniPlayerController());
  Widget _sectionOne(String value, int index, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              value,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            GestureDetector(
              onTap: () {
                if (index == 1) {
                  NavigatorController.to.setCategoryPage(true);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomeDetail()));
                  // Get.toNamed('/detailInterview');
                } else {
                  NavigatorController.to.setCategoryPage(true);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ReqPage()));
                }
              },
              child: Text(
                '더보기',
                style: TextStyle(
                  color: Colors.grey[500],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _listView() {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Container(
          height: Get.height / 4.5,
          color: Colors.black,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: controller.interView.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {},
                child: Column(
                  children: [
                    Expanded(
                      flex: 6,
                      child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Container(
                          width: Get.width / 3,
                          color: Colors.grey,
                          child: GestureDetector(
                            onTap: () {
                              controllerMini.assetsAudioPlayer.pause();
                              controllerMini.isPlay.value = false;
                              controllerMini.controllerAnimate.reverse();
                              Get.toNamed('/interviewInfo', arguments: index);
                            },
                            child: CachedNetworkImage(
                                fit: BoxFit.fill,
                                progressIndicatorBuilder:
                                    (context, url, progress) => Center(
                                          child: CircularProgressIndicator(
                                            color: Colors.white70,
                                            value: progress.progress,
                                          ),
                                        ),
                                imageUrl: controller.interView.value[index].url
                                    .toString()
                                // controller.interView,
                                //  imageUrl :   'https://i.ytimg.com/vi/qx64rkEDMHY/hqdefault.jpg?sqp=-oaymwEjCNACELwBSFryq4qpAxUIARUAAAAAGAElAADIQj0AgKJDeAE=&rs=AOn4CLALsJftiloAAjt8Ym5w85QAjPkIPQ',
                                ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        color: Colors.black,
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          // crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  controller.interView.value[index].name
                                      .toString(),
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12),
                                ),
                                Text(
                                  '  ${controller.interView.value[index].age}대',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  controller.interView.value[index].job,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _banner() {
    return Container(
      height: 300,
      child: CarouselWithIndicatorDemo(),
    );
  }

  Widget _gridView() {
    return Container(
      child: GridView.builder(
        primary: false,
        shrinkWrap: true,
        // scrollDirection: Axis.vertical,
        itemCount: 6,
        //item 개수
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, //1 개의 행에 보여줄 item 개수
          childAspectRatio: 1 / 2, //item 의 가로 1, 세로 2 의 비율
          mainAxisSpacing: 10, //수평 Padding
          crossAxisSpacing: 10, //수직 Padding
        ),
        itemBuilder: (BuildContext context, int index) {
          //item 의 반목문 항목 형성
          return Container(
            // color: Colors.lightGreen,
            child: CachedNetworkImage(
              imageUrl: imgList[index],
              // width: 200,
              // height: 500,
              fit: BoxFit.fill,
            ),
          );
        },
      ),
    );
  }

  Widget _gridViewReq() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        child: GridView.builder(
          primary: false,
          shrinkWrap: true,
          // scrollDirection: Axis.vertical,
          itemCount: 3,
          //item 개수
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, //1 개의 행에 보여줄 item 개수
            childAspectRatio: 1 / 1, //item 의 가로 1, 세로 2 의 비율
            mainAxisSpacing: 10, //수평 Padding
            crossAxisSpacing: 10, //수직 Padding
          ),
          itemBuilder: (BuildContext context, int index) {
            //item 의 반목문 항목 형성
            return Container(
              // color: Colors.lightGreen,
              child: CachedNetworkImage(
                imageUrl: imgListReq[index],
                // width: 200,
                // height: 500,
                fit: BoxFit.fill,
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SafeArea(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          // mainAxisAlignment: MainAxisAlignment.spaceArou,
          children: [
            _banner(),
            // test2(),
            // test2(),
            _sectionOne('제작 과정 인터뷰', 1, context),
            _listView(),
            SizedBox(
              height: 40,
            ),
            _gridView(),
            SizedBox(
              height: 10,
            ),
            _sectionOne('제작 신청', 2, context),
            _gridViewReq(),
            // test(),
            // _sectionOne('사연 신청', 2 , context),
            // _listView(),
            // _sectionOne('사연 신청', 2),
            // test(),
          ],
        ),
      ),
    );
  }
}
