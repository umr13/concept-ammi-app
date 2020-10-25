import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:Ammiv1/ui/router.dart' as router;

import '../main.dart';

class ClinicRating extends StatefulWidget {
  @override
  _ClinicRatingState createState() => _ClinicRatingState();
}

class _ClinicRatingState extends State<ClinicRating> {

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
        title: Align(alignment: Alignment.center,child: Text("Clinic Ratings",style: TextStyle(color: Colors.black,fontSize: 25, letterSpacing: 2, fontWeight: FontWeight.w300),)),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(8, 25, 8, 0),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Align(alignment:Alignment.centerLeft,child: Text("Clinics\nNear Me",style: TextStyle(fontSize: 40),)),
                Padding(padding: EdgeInsets.all(20),),
                Align(alignment:Alignment.centerLeft,child: Text("Lahore Clinic",style: TextStyle(fontSize: 25),)),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.yellow[600],),
                    Icon(Icons.star, color: Colors.yellow[600],),
                    Icon(Icons.star, color: Colors.yellow[600],),
                    Icon(Icons.star, color: Colors.yellow[600],)
                  ],
                ),
                Padding(padding: EdgeInsets.all(20),),
                Align(alignment:Alignment.centerLeft,child: Text("One Clinic",style: TextStyle(fontSize: 25),)),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.yellow[600],),
                    Icon(Icons.star, color: Colors.yellow[600],),
                    Icon(Icons.star, color: Colors.yellow[600],),
                  ],
                ),
                Padding(padding: EdgeInsets.all(20),),
                Align(alignment:Alignment.centerLeft,child: Text("Sample Clinic",style: TextStyle(fontSize: 25),)),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.yellow[600],),
                    Icon(Icons.star, color: Colors.yellow[600],),
                    Icon(Icons.star, color: Colors.yellow[600],),
                    Icon(Icons.star, color: Colors.yellow[600],),
                    Icon(Icons.star, color: Colors.yellow[600],)
                  ],
                ),
                Padding(padding: EdgeInsets.all(20),),
                Align(alignment:Alignment.centerLeft,child: Text("Sameple2 Clinic",style: TextStyle(fontSize: 25),)),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.yellow[600],),
                    Icon(Icons.star, color: Colors.yellow[600],),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
