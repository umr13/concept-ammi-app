import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:Ammiv1/ui/router.dart' as router;
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../main.dart';

class Video extends StatefulWidget {
  @override
  _VideoState createState() => _VideoState();
}

class _VideoState extends State<Video> {

  final router.Router _router = router.Router.instance;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _router.init();
  }

  YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: "LB7emV8TcRg",
    flags: YoutubePlayerFlags(
      loop: false,
      forceHD: false,
      autoPlay: true,
      isLive: false,
      mute: false,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            child: Icon(Icons.arrow_back, color: Colors.black,),
            onTap: (){
             Navigator.pop(context);
            },
        ),
        backgroundColor: Color.fromRGBO(247, 203, 175,1),
        title: Align(alignment: Alignment.center,child: Text("Why Vaccinate?",style: TextStyle(color: Colors.black,fontSize: 25, letterSpacing: 2, fontWeight: FontWeight.w300),)),
      ),
      body:Container(
        color: Colors.grey[500],
        child: Center(
          child: YoutubePlayer(
            controller: _controller,
            liveUIColor: Colors.amber,
          ),
        ),
      ),
    );
  }
}
