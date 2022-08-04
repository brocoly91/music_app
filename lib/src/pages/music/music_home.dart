import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app/src/controller/hive_controller.dart';
import 'package:music_app/src/model/music_data.dart';
import 'package:music_app/src/pages/music/music_detail.dart';

class MusicHome extends StatefulWidget {
  const MusicHome({Key? key}) : super(key: key);

  @override
  State<MusicHome> createState() => _MusicHomeState();
}

class _MusicHomeState extends State<MusicHome>  with TickerProviderStateMixin{

  late TabController _tabController;
  final HiveContoller controllerHive = Get.put(HiveContoller());
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  Widget TrackComponent(index){
    return Column(
      children: [
        Card(
          color: Colors.black26,
          child: GestureDetector(
            onTap: ()
            {
              controllerHive.saveData(index.toString());
            },
            child: ListTile(
              leading: CircleAvatar(
                // backgroundImage: CachedNetworkImageProvider(totalSongList[index].image),
                backgroundImage: AssetImage("assets/${totalSongList[index].image}"),
                radius: 30,
              ),
              title: Text(totalSongList[index].title,style: TextStyle(color: Colors.white),),
              subtitle: Text(totalSongList[index].singer,style: TextStyle(color: Colors.white),),
              trailing: GestureDetector(
                  onTap: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MusicDetail(itemId : index.toString()))
                    );
                  },
                  child: Icon(Icons.more_vert,color: Colors.white,)
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget TrackWidget(context){
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: totalSongList.length,
      itemBuilder: (BuildContext context, int index) {
        return TrackComponent(index);
      },
    );
  }

  Widget TrackWidget2(context){
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return TrackComponent(index+10);
      },
    );
  }

  Widget TrackWidget3(context){
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return TrackComponent(index);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text('PPOP 음원 목록',style: TextStyle(color: Colors.white,fontSize: 20),),
        bottom: TabBar(
          controller: _tabController,
          tabs: const <Widget>[
            Tab(
              icon: Text('전체',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
            ),
            Tab(
              icon: Text('최신음악',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
            ),
            Tab(
              icon: Text('인기음악',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Center(
            child: Container(child: TrackWidget(context),color: Colors.black,),
          ),
          Center(
            child: Container(child: TrackWidget2(context),color: Colors.black,),
          ),
          Center(
            child: Container(child: TrackWidget3(context),color: Colors.black,),
          ),
        ],
      ),
    );
  }
}
