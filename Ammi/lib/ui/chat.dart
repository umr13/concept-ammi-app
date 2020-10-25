import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:Ammiv1/ui/router.dart' as router;

import '../main.dart';


class Chat extends StatefulWidget {
  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {

  final router.Router _router = router.Router.instance;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _router.init();
  }


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
        title: Align(alignment: Alignment.center,child: Text("ASK AMMI",style: TextStyle(color: Colors.black,fontSize: 25, letterSpacing: 2, fontWeight: FontWeight.w300),)),
      ),
      body: Container(
        child: Center(child:Text("Coming Sooon"),),
      ),
    );
  }
}
