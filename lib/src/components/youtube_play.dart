import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubePlay extends StatefulWidget {
  final String? vedioUrl;
  const YoutubePlay({Key? key,this.vedioUrl}) : super(key: key);

  @override
  State<YoutubePlay> createState() => _YoutubePlayState();
}

class _YoutubePlayState extends State<YoutubePlay> {

  YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: 'iLnmTe5Q2Qw',
    flags: YoutubePlayerFlags(
      autoPlay: true,
      mute: true,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      child: YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: true,


      ),
    );
  }
}

