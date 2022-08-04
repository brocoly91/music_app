import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math';
import 'package:hive/hive.dart';
import 'package:music_app/src/controller/hive_controller.dart';
import 'package:music_app/src/controller/mini_player_controller.dart';
import 'package:music_app/src/model/music_data.dart';
import 'package:music_app/src/pages/music/music_detail.dart';

class MyList extends StatefulWidget {
  const MyList({Key? key}) : super(key: key);

  @override
  State<MyList> createState() => _MyListState();
}

class _MyListState extends State<MyList> with TickerProviderStateMixin {
  late TabController _tabController;
  final HiveContoller controllerHive = Get.put(HiveContoller());
  final MiniPlayerController controllerMini = Get.put(MiniPlayerController());

  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);

    _controller = AnimationController(
        duration: const Duration(milliseconds: 2000),
        vsync: this,
        value: 0.25,
        lowerBound: 0.5,
        upperBound: 1.0);
    _animation = CurvedAnimation(parent: _controller, curve: Curves.linear);

    _controller.repeat(reverse: true);
  }

  @override
  dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Colors.black,
        // centerTitle: true,
        // title: Visibility(visible: false,child: const Text('플레이리스트',style: TextStyle(color: Colors.white,fontSize: 20),)),
        bottom: TabBar(
          controller: _tabController,
          tabs: const <Widget>[
            Tab(
              icon: Text(
                'Play list',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
            ),
            Tab(
              icon: Text(
                '나의발매곡',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Center(
            child: Container(
              child: TrackWidget(context),
              color: Colors.black,
              alignment: Alignment.topCenter,
            ),
          ),
          Center(
            child: Container(
              child: TrackWidget(context),
              color: Colors.black,
              alignment: Alignment.topCenter,
            ),
          ),
        ],
      ),
    );
  }

  Widget TrackWidgetComponent(index) {
    return Column(
      children: [
        controllerHive.list.length > 0
            ? Card(
                color: Colors.black26,
                child: GestureDetector(
                  onTap: () {
                    controllerMini.listChange(index);
                    print("index" +
                        index.toString() +
                        '/' +
                        controllerHive.list[index].toString() +
                        '/' +
                        controllerMini.currentIdx.toString());
                  },
                  child: Obx(
                    () => ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      tileColor: controllerMini.currentIdx.toString() ==
                              index.toString()
                          ? Colors.pink
                          : Colors.black,
                      leading: controllerMini.currentIdx.toString() ==
                                  index.toString() &&
                              controllerMini.isPlay == true
                          ? RotationTransition(
                              turns: _animation,
                              child: CircleAvatar(
                                backgroundImage: AssetImage(
                                    "assets/${totalSongList[int.parse(controllerHive.list[index].toString())].image}"),
                                radius: 30,
                              ),
                            )
                          : CircleAvatar(
                              backgroundImage: AssetImage(
                                  "assets/${totalSongList[int.parse(controllerHive.list[index].toString())].image}"),
                              radius: 30,
                            ),
                      title: Text(
                        totalSongList[int.parse(controllerHive.list[index])]
                            .title,
                        style: TextStyle(color: Colors.white),
                      ),
                      subtitle: Text(
                        totalSongList[int.parse(
                                controllerHive.list[index].toString())]
                            .singer,
                        style: TextStyle(color: Colors.white),
                      ),
                      trailing: GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            context: context,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20),),
                            ),
                            builder: (BuildContext context) {
                              return Container(
                                height: 150,
                                color: Colors.grey[300],
                                child: Column(
                                  children: [
                                    Divider(color: Colors.black,thickness: 1,height: 0,),
                                    Expanded(
                                      child: Container(
                                        alignment: Alignment.center,
                                        color: Colors.white,
                                        child: IconButton(
                                          icon: Icon(Icons.arrow_drop_down, color: Colors.black54,size: 40,),
                                          onPressed: () => Navigator.pop(context),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: GestureDetector(
                                        onTap: (){
                                          print("asdawd111=="+  index.toString());
                                          // controllerMini.test();
                                          Navigator.pop(context);
                                          controllerHive.deleteData(controllerHive.list[index].toString(),index.toString());
                                          // controllerMini.deleteList(controllerHive.list[index].toString(),index.toString());
                                        },
                                        child: Container(
                                          color: Colors.grey[300],
                                          alignment: Alignment.center,
                                          child: Text('음원 목록에서 삭재',style: TextStyle(color: Colors.black),),
                                        ),
                                      ),
                                    ),
                                    Divider(color: Colors.black54,thickness: 1,height: 0,),
                                    Expanded(
                                      child: GestureDetector(
                                        onTap: (){
                                          Navigator.pop(context);
                                          Navigator.push(context,
                                              MaterialPageRoute(builder: (context) => MusicDetail(itemId : controllerHive.list[index].toString()))
                                          );

                                        },
                                        child: Container(
                                          alignment: Alignment.center,
                                          color: Colors.grey[300],
                                          child: Text('음원 상세보기',style: TextStyle(color: Colors.black),),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            });
                          // controllerHive.clear();
                          // controllerHive.loadData();
                          // Navigator.push(context,
                          //     MaterialPageRoute(builder: (context) => MusicDetail(todo :index.toString()))
                          // );
                        },
                        child: Icon(
                          Icons.more_vert,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            : Container()
      ],
    );
  }

  Widget TrackWidget(context) {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: controllerHive.list.length,
      itemBuilder: (BuildContext context, int index) {
        return TrackWidgetComponent(index);
      },
    );
  }
}
