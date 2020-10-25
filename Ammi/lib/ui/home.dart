import 'dart:ui';

import 'package:Ammiv1/models/ammi_user.dart';
import 'package:Ammiv1/ui/baby.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:Ammiv1/ui/router.dart' as router;

import '../main.dart';

class HomeScreen extends StatefulWidget {
  final AmmiUser currentAmmiUser;
  HomeScreen({this.currentAmmiUser});
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
        backgroundColor: Color.fromRGBO(247, 203, 175, 1),
        title: Align(
            alignment: Alignment.center,
            child: Text(
              "AMMI",
              style: TextStyle(color: Colors.black, fontSize: 25, letterSpacing: 2, fontWeight: FontWeight.w300),
            )),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
            //child: Icon(Icons.notifications, size: 30,),
          )
        ],
      ),
      body: Stack(
        children: <Widget>[
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      InkWell(
                        child: Container(
                          height: 250,
                          child: Card(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                            color: Colors.black,
                            child: Stack(
                              children: <Widget>[
                                Align(alignment: Alignment.center, child: Image.asset("assets/parent-baby.jpeg", fit: BoxFit.cover)),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      "Why\nVaccinate?",
                                      style: TextStyle(color: Colors.grey[100], fontSize: 45, fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, _router.VIDEO);
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            InkWell(
                              child: Container(
                                width: 185,
                                height: 185,
                                child: Card(
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                                  color: Color.fromRGBO(247, 203, 175, 1),
                                  child: Stack(
                                    children: <Widget>[
                                      Align(
                                        child: Image.asset(
                                          "assets/find-clinic.png",
                                          scale: 3,
                                        ),
                                        alignment: Alignment.topRight,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Align(
                                          alignment: Alignment.bottomLeft,
                                          child: Text(
                                            "Clinic\nRatings",
                                            style: TextStyle(fontSize: 40, fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              onTap: () {
                                Navigator.pushNamed(context, _router.CLINIC);
                              },
                            ),
                            InkWell(
                              child: Container(
                                width: 185,
                                height: 185,
                                child: Card(
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                                  color: Colors.grey[200],
                                  child: Stack(
                                    children: <Widget>[
                                      Align(
                                        child: Image.asset(
                                          "assets/cute-baby.png",
                                          scale: 2.5,
                                        ),
                                        alignment: Alignment.bottomRight,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            "My\nBaby",
                                            style: TextStyle(fontSize: 40, fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (c) => MyBaby(currentAmmiUser: widget.currentAmmiUser),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        child: Container(
                          height: 150,
                          width: 380,
                          child: Card(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                            color: Color.fromRGBO(247, 203, 175, 1),
                            child: Stack(
                              children: <Widget>[
                                Align(
                                  child: Image.asset("assets/overtime.png"),
                                  alignment: Alignment.centerRight,
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Book\nOnline\nAppointment",
                                      style: TextStyle(fontSize: 35, fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, _router.BOOKING);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
