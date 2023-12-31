import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayer extends StatefulWidget {

  final String url;

  const VideoPlayer({super.key, required this.url});

  @override

  // ignore: library_private_types_in_public_api
  _VideoPlayerState createState() => _VideoPlayerState();

}



class _VideoPlayerState extends State<VideoPlayer> {

  late YoutubePlayerController _controller;

  late TextEditingController _idController;

  late TextEditingController _seekToController;

  late PlayerState _playerState;

  late YoutubeMetaData _videoMetaData;

  bool _isPlayerReady = false;



  late String videoId;



  @override

  void initState() {

    super.initState();

    videoId = YoutubePlayer.convertUrlToId(widget.url)!;

    if (kDebugMode) {
      print(videoId);
    }

    _controller = YoutubePlayerController(

        initialVideoId: videoId,

        flags: const YoutubePlayerFlags(

            mute: false,

            autoPlay: true,

            disableDragSeek: false,

            loop: false,

            isLive: false,

            forceHD: false,

            enableCaption: true))

      ..addListener(listener);

    _idController = TextEditingController();

    _seekToController = TextEditingController();

    _videoMetaData = const YoutubeMetaData();

    _playerState = PlayerState.unknown;

  }



  void listener() {

    if (_isPlayerReady && mounted && !_controller.value.isFullScreen) {

      setState(() {

        _playerState = _controller.value.playerState;

        _videoMetaData = _controller.metadata;

      });

    }

  }



  @override

  void dispose() {

    _controller.dispose();

    _idController.dispose();

    _seekToController.dispose();

    super.dispose();

  }



  @override

  Widget build(BuildContext context) {

    return YoutubePlayerBuilder(

      onExitFullScreen: () {

        SystemChrome.setPreferredOrientations(DeviceOrientation.values);

      },

      player: YoutubePlayer(

          controller: _controller,

          showVideoProgressIndicator: true,

          progressIndicatorColor: Colors.blueAccent,

          topActions: <Widget>[

            const SizedBox(width: 8.0),

            Expanded(

                child: Text(_controller.metadata.title,

                    style: const TextStyle(

                      color: Colors.white,

                      fontSize: 18.0,

                    ),

                    overflow: TextOverflow.ellipsis,

                    maxLines: 1))

          ],

          onReady: () {

            _isPlayerReady = true;

          },

          onEnded: (data) {}),

      builder: (context, player) => Scaffold(

        body: player,

      ),

    );

  }

}