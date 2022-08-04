import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app/src/pages/search/SearchFocus.dart';
import 'package:quiver/iterables.dart';
class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<List<int>> groupBox = [[],[],[]];
  List<int> groupIdex = [0,0,0];

  @override
  void initState(){
    super.initState();
    for(var i=0;i<100;i++) {
      var gi = groupIdex.indexOf(min<int>(groupIdex)!);
      var size = 1;
      if(gi != 1){
        size = Random().nextInt(100) % 2 == 0 ? 1 : 2;
      }
      groupBox[gi].add(size);
      groupIdex[gi]+= size;
    }
    print(groupBox);
  }

  Widget _appbar(){
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SearchFocus()));
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8 ,horizontal: 10),
              margin: const EdgeInsets.only(left: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: const Color(0xffefefef),
              ),
              child: Row(children: const [

                Icon(Icons.search),
                Text('검색', style: TextStyle(fontSize: 15,color: Color(0xff838383)),)
              ],),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(15.0),
          child: Icon(Icons.location_pin,color: Colors.white,),
        ),
      ],
    );
  }

  Widget _body(){
    return SingleChildScrollView(
      child: Row(
        children: List.generate(
          groupBox.length,
              (index) => Expanded(
            child: Column(
              children: List.generate(
                groupBox[index].length,
                    (jndex) => Container(
                  height: Get.width*0.33*groupBox[index][jndex],
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    color: Colors.primaries[
                    Random().nextInt(Colors.primaries.length)],),
                  child: CachedNetworkImage(imageUrl: 'https://www.urbanbrush.net/web/wp-content/uploads/edd/2021/06/urbanbrush-20210611102855770634.jpg',fit: BoxFit.cover,),
                ),
              ),
            ),
          ),
        ).toList(),
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            _appbar(),
            Expanded(child: _body()),
          ],
        ),
      ),
    );
  }
}
