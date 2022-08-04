import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app/src/controller/hive_controller.dart';
import 'package:music_app/src/model/music_data.dart';

class MusicDetail extends StatefulWidget {
  // final itemId;

  final String itemId;

  const MusicDetail({Key? key, required this.itemId}) : super(key: key);

  @override
  State<MusicDetail> createState() => _MusicDetailState();
}

class _MusicDetailState extends State<MusicDetail> {
  final HiveContoller controllerHive = Get.put(HiveContoller());
  bool dropIcon = false;
  bool favoritIcon = true;

  Widget TopLayer() {
    return Container(
      color: Colors.black,
      height: 200,
      width: Get.width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            width: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 10,
                  offset: Offset(8, 8), // Shadow position
                ),
              ],
            ),
            child: Image.asset(
              "assets/${totalSongList[int.parse(widget.itemId)].image}",
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
              padding: EdgeInsets.symmetric(vertical: 20),
              alignment: Alignment.bottomRight,
              child: Row(
                children: [
                  favoritIcon ?
                  IconButton(
                      onPressed: () {
                        setState(() {
                          favoritIcon = !favoritIcon;
                        });
                      },
                      icon: Icon(
                        Icons.favorite_border,
                        size: 40,
                        color: Colors.white,
                      )
                  )
                  :
                  IconButton(
                      onPressed: () {
                        setState(() {
                          favoritIcon = !favoritIcon;
                        });
                      },
                      icon: Icon(
                        Icons.favorite,
                        size: 40,
                        color: Colors.red,
                      )
                  ),
                  IconButton(
                      onPressed: () {
                        controllerHive.saveData(widget.itemId.toString());
                      },
                      icon: Icon(
                        Icons.playlist_add,
                        size: 50,
                        color: Colors.white,
                      )),
                ],
              )),
        ],
      ),
    );
  }

  Widget CenterLayer(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: Get.width/4.5),
      child: Row(
        children: [
          Text(
            '가사',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          dropIcon ? IconButton(onPressed: (){
            setState(() {
              dropIcon = !dropIcon;
            });
          }, icon: Icon(Icons.arrow_drop_down,color: Colors.white,),)
              : IconButton(onPressed: (){
            setState(() {
              dropIcon = !dropIcon;
            });
          }, icon: Icon(Icons.arrow_drop_up,color: Colors.white,),)
        ],
      ),

    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(totalSongList[int.parse(widget.itemId)].title +
            ' (' +
            totalSongList[int.parse(widget.itemId)].name +
            ')'),
        // centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            TopLayer(),
            SizedBox(
              height: 50,
            ),
            CenterLayer(),
            SizedBox(
              height: 30,
            ),
            dropIcon ?
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              alignment: Alignment.center,
              child: Text(
                totalSongList[0].lyic.toString(),
                style: TextStyle(color: Colors.white,fontWeight: FontWeight.w200,fontSize: 18),
              ),
            )
            :
            Container(
              width: Get.width/1.5,
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 20),
              // alignment: Alignment.topLeft,
              child: Text(
                totalSongList[0].lyic.toString(),
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.white,fontWeight: FontWeight.w200,fontSize: 18),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
