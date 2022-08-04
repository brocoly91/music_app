import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:music_app/src/controller/hive_controller.dart';
import 'package:music_app/src/controller/home_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:music_app/src/model/music_data.dart';
import 'package:music_app/src/pages/music/music_detail.dart';
import 'package:music_app/src/pages/music/music_home.dart';


class Music extends StatelessWidget {
  Music({Key? key}) : super(key: key);

  final HomeController controller = Get.put(HomeController());
  final HiveContoller controllerHive = Get.put(HiveContoller());

  Widget _rowWidGet(String title) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold
        ),
      ),
    );
  }

  Widget _listViewNewTrackList() {
    return
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0),
        child: Container(
          // height: 300,
          height: Get.height / 4.5,
          color: Colors.black,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {},
                child: Column(
                  children: [
                    Expanded(
                      flex: 6,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: Get.width / 3,
                          color: Colors.black,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => MusicDetail(itemId : index.toString()))
                              );
                            },
                            child: CircleAvatar(
                              backgroundImage: AssetImage("assets/${totalSongList[index].image}"),
                            )
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        color: Colors.black,
                        child: Column(
                          children: [
                            Text(
                              totalSongList[index].title
                                  .toString(),
                              style: TextStyle(
                                  color: Colors.white, fontSize: 15),
                            ),
                            Text(
                              totalSongList[index].name,
                              style: TextStyle(
                                  color: Colors.white, fontSize: 12),
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
    );
  }

  Widget _chart() {
    return CarouselSlider(
      options: CarouselOptions(
        height: 435,
        aspectRatio: 16 / 9,
        viewportFraction: 0.8,
        initialPage: 0,
        disableCenter: true,
        // enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 5),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        // autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        // onPageChanged: callbackFunction,
        scrollDirection: Axis.horizontal,
      ),
      items: [1, 2].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return _listViewTrack(i);
          },
        );
      }).toList(),
    );
  }

  Widget _listViewTrack(int i) {
    final asdawd = ['00', '최신음악', '인기음악'];
    return Container(
      color: Colors.black,
      // color: Colors.grey[500],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(
              asdawd[i].toString(),
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
          Expanded(
            child: ListView.builder(
                // shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    // crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Card(
                        color: Colors.grey[800],
                        child: GestureDetector(
                          onTap: () {
                            if(i ==1){
                              controllerHive.saveData(index.toString());
                            }else{
                              int calnum = index+10;
                              controllerHive.saveData(calnum.toString());
                            }
                          },
                          child: ListTile(
                            leading: CircleAvatar(
                              radius: 25,
                              backgroundImage: AssetImage(
                                i == 1 ? "assets/${totalSongList[index].image}" : "assets/${totalSongList[index+10].image}",
                              ),
                            ),
                            title: Text(
                              i == 1 ? totalSongList[index].title : totalSongList[index+10].title,
                              style: TextStyle(color: Colors.white),
                            ),
                            subtitle: Text(
                              i == 1 ? totalSongList[index].name : totalSongList[index+10].name,
                              style: TextStyle(color: Colors.white),
                            ),
                            trailing: GestureDetector(
                                onTap: () {
                                  int num;
                                  if(i ==1 ){
                                    num = index;
                                  }else{
                                    num = index + 10;
                                  }
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) => MusicDetail(itemId : num.toString()))
                                  );
                                },
                                child: Icon(
                                  Icons.more_vert,
                                  color: Colors.white,
                                )),
                          ),
                        ),
                      ),
                    ],
                  );
                }),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            // height: 500,
            // width: Get.width,
            color: Colors.black,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _rowWidGet("신규 음원"),
                SizedBox(
                  height: 5,
                ),
                _listViewNewTrackList(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _rowWidGet("음원 목록"),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MusicHome()));
                        },
                        child: Text(
                          '전체보기',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                _chart(),
                SizedBox(
                  height: 15,
                ),
                // _listViewTrack(),
                // _ListPageView(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
