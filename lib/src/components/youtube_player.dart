import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:music_app/src/controller/home_controller.dart';
import 'package:music_app/src/model/home.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class YoutubePlayer extends StatefulWidget {
  final String? vedioUrl;
  const YoutubePlayer({Key? key,this.vedioUrl}) : super(key: key);

  @override
  State<YoutubePlayer> createState() => _YoutubePlayerState();
}

class _YoutubePlayerState extends State<YoutubePlayer> {
  final HomeController controller = Get.put(HomeController());
  late YoutubePlayerController _controller;

  @override
  void initState() {
    print('???=====' + widget.vedioUrl.toString());
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.vedioUrl.toString(),
      params: YoutubePlayerParams(
        playlist: [
          // 'nPt8bK2gbaU',
          // 'K18cpp_-gP8',
          // 'iLnmTe5Q2Qw',
          // '_WoCV4c6XOE',
          // 'KmzdUe0RSJo',
          // '6jZDSSZZxjQ',
          // 'p2lYr3vM_1w',
          // '7QUtEmBT_-w',
          // '34_PXCzGw1M',
        ],
        autoPlay: true,
        startAt: const Duration(seconds: 0),
        showControls: true,
        showFullscreenButton: true,
        desktopMode: false,
        privacyEnhanced: true,
        useHybridComposition: true,
      ),
    );
    _controller.onEnterFullscreen = () {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
      log('Entered Fullscreen');
    };
    _controller.onExitFullscreen = () {
      log('Exited Fullscreen');
    };
  }

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    const player = YoutubePlayerIFrame();
    return YoutubePlayerControllerProvider(
      // Passing controller to widgets below.
      controller: _controller,
      child: Scaffold(
        body: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              print('??kIsWeb===' + kIsWeb.toString());
              print('??constraints.maxWidth===' +constraints.maxWidth.toString());
              // if (kIsWeb && constraints.maxWidth > 800) {
              //   return Row(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       const Expanded(child: player),
              //       const SizedBox(
              //         width: 500,
              //         child: SingleChildScrollView(
              //           child: Text('data??'),
              //         ),
              //       ),
              //     ],
              //   );
              // }
              return Stack(
                children: [
                  player,
                  Positioned.fill(
                    child: YoutubeValueBuilder(
                      controller: _controller,
                      builder: (context, value) {
                        return AnimatedCrossFade(
                          firstChild: const SizedBox.shrink(),
                          secondChild: const Material(
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                // image: DecorationImage(image)
                                // gradient: LinearGradient(
                                //   colors: [
                                //     const Color(0xFF9B782F),
                                //     const Color(0xFF00CCFF),
                                //   ],
                                //   begin: const FractionalOffset(0.0, 0.0),
                                //   end: const FractionalOffset(1.0, 0.0),
                                //   stops: [0.0, 1.0],
                                //   tileMode: TileMode.clamp,
                                // ),
                                // image: DecorationImage(
                                  // image: NetworkImage(
                                  //   YoutubePlayerController.getThumbnail(
                                  //     videoId:
                                  //     _controller.initialVideoId,
                                  //     quality: ThumbnailQuality.medium,
                                  //   ),
                                  // ),
                                  // fit: BoxFit.fitHeight
                                  // fit: BoxFit.fill,
                                  // fit: BoxFit.fitWidth,
                                // ),
                              ),
                              child: const Center(
                                child: CircularProgressIndicator(
                                  color: Colors.white
                                ),
                              ),
                            ),
                          ),
                          crossFadeState: value.isReady
                              ? CrossFadeState.showFirst
                              : CrossFadeState.showSecond,
                          duration: const Duration(milliseconds: 300),
                        );
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

}
