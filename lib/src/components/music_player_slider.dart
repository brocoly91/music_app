// import 'package:audioplayers/audioplayers.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:music_app/src/controller/mini_player_controller.dart';
//
// class MusicPlayerSlider extends StatefulWidget {
//   const MusicPlayerSlider({Key? key}) : super(key: key);
//
//   @override
//   State<MusicPlayerSlider> createState() => _MusicPlayerSliderState();
// }
//
// class _MusicPlayerSliderState extends State<MusicPlayerSlider> {
//
//   final MiniPlayerController controller = Get.put(MiniPlayerController());
//
//
//   @override
//   void initState(){
//     super.initState();
//     initPlayer();
//   }
//
//   void initPlayer(){
//
//   }
//
//   void seekToSecond(int second) {
//     Duration newDuration = Duration(seconds: second);
//
//     controller.assetsAudioPlayer.seek(newDuration);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Slider(
//       min: 0.0,
//       max: controller.assetsAudioPlayer.,
//       // max: playing2.duration.inMilliseconds.toDouble() - 0.01,
//       value: position.inMilliseconds.toDouble() == playing2.duration.inMilliseconds.toDouble()
//           ? 0.0
//           : position.inMilliseconds.toDouble(),
//       onChanged: (double value) {
//         _assetsAudioPlayer.seek(Duration(milliseconds: value.toInt()));
//         value = value;
//       },
//       onChangeEnd: (double value) {
//       },
//       activeColor: Colors.blue,
//       inactiveColor: Color(0xFFCEE3EE),
//     );
//   }
// }
