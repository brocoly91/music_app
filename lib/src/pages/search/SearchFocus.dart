import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app/src/controller/navigator_controller.dart';
import 'package:music_app/src/pages/search/search.dart';


class SearchFocus extends StatefulWidget {
  const SearchFocus({Key? key}) : super(key: key);

  @override
  State<SearchFocus> createState() => _SearchFocusState();
}

class _SearchFocusState extends State<SearchFocus>  with TickerProviderStateMixin{

  late TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 5, vsync: this);
  }
  Widget _tabMenuOne(String menu){
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15.0),
      child: Text(
        menu,
        style: TextStyle(fontSize: 14,color: Colors.white),
      ),
    );
  }

  Widget _body(){
    return Container(
      child: TabBarView(
          controller: tabController,
          children: const [
            Center(child: Text('인기페이지')),
            Center(child: Text('음악페이지')),
            Center(child: Text('비디오페이지')),
            Center(child: Text('인터뷰페이지')),
            Center(child: Text('장소페이지')),
          ]
      ),
    );
  }

  PreferredSizeWidget _tabMenu(){
    return PreferredSize(
      child: Container(
        // color: Colors.red,
        height: AppBar().preferredSize.height,
        width: Size.infinite.width,
        decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Color(0xffe4e4e4)))),
        child: TabBar(
            controller: tabController,
            indicatorColor: Colors.black,
            tabs: [
              _tabMenuOne('인기'),
              _tabMenuOne('전체'),
              _tabMenuOne('음악'),
              _tabMenuOne('비디오'),
              _tabMenuOne('인터뷰'),
            ]),
      ),
      preferredSize: Size.fromHeight(AppBar().preferredSize.height),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation:0,
        // leading:  GestureDetector(
        //   // onTap:  Get.back(result: Search());
        //   // onTap: BottomNavController.to.willPopAction,
        //   child: Padding(
        //     padding: const EdgeInsets.all(15.0),
        //     child: Icon(Icons.arrow_back,color: Colors.black,),
        //   ),
        // ),
        titleSpacing: 0,
        title: Container(
          margin: const EdgeInsets.only(right: 15),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(6),color: const Color(0xffefefef)),
          child: const TextField(
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: '검색',
                contentPadding: EdgeInsets.only(left: 4,top: 7,bottom: 7),isDense: true
            ),
          ),
        ),
        bottom: _tabMenu(),
      ),
      body: _body(),
    );
  }
}
