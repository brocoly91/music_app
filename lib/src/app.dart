import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app/src/components/mini_player.dart';
import 'package:music_app/src/controller/navigator_controller.dart';
import 'package:music_app/src/pages/MyList/mylist.dart';
import 'package:music_app/src/pages/home/home.dart';
import 'package:music_app/src/pages/music/music.dart';
import 'package:music_app/src/pages/search/search.dart';

class App extends GetView<NavigatorController> {
  App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: controller.onWillPop,
      child: Obx(
        () => Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            title: Text("PPOP"),
            backgroundColor: Colors.black,
            // title: const Text('music'),
            // centerTitle: true,
            // leading: controller.isCategoryPageOpen.value
            //     ? GestureDetector(
            //   onTap: controller.back,
            //   child: const Icon(Icons.arrow_back_ios),
            // )
            //     : Container(),
            centerTitle: true,
            // title: controller.isCategoryPageOpen.value
            //     ? const Text('Music Menu')
            //     : const Text('Music App'),
          ),
          body: IndexedStack(
            index:  controller.rootPageIndex.value,
            children: [
              Navigator(
                key: controller.navigatorKey,
                onGenerateRoute: (routeSettings) {
                  return MaterialPageRoute(
                    builder: (context) => Home(),
                  );
                },
              ),
              Navigator(
                // key: controller.navigatorKey,
                onGenerateRoute: (routeSettings) {
                  return MaterialPageRoute(
                    builder: (context) => Music(),
                  );
                },
              ),
              Navigator(
                // key: controller.navigatorKey,
                onGenerateRoute: (routeSettings) {
                  return MaterialPageRoute(
                    builder: (context) => Search(),
                  );
                },
              ),
              Navigator(
                // key: controller.navigatorKey,
                onGenerateRoute: (routeSettings) {
                  return MaterialPageRoute(
                    builder: (context) => MyList(),
                  );
                },
              ),
            ],
          ),
          bottomNavigationBar: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              MiniPlayer(),
              BottomNavigationBar(
                backgroundColor: Colors.black,
                type: BottomNavigationBarType.fixed,
                currentIndex: controller.rootPageIndex.value,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                onTap: controller.changeRootPageIndex,
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home ,color: Colors.white),
                    activeIcon: Icon(Icons.home , color: Colors.red),
                    label: 'home',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.music_note,color: Colors.white,),
                    activeIcon: Icon(Icons.music_note , color: Colors.red),
                    label: 'music',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.search,color: Colors.white,),
                    activeIcon: Icon(Icons.search , color: Colors.red,),
                    label: 'search',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.playlist_play,color: Colors.white,),
                    activeIcon: Icon(Icons.playlist_play , color: Colors.red,),
                    label: 'user',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
