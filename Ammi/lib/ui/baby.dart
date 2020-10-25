import 'dart:ui';

import 'package:Ammiv1/models/ammi_user.dart';
import 'package:flutter/material.dart';
import 'package:Ammiv1/ui/router.dart' as router;
import 'package:provider/provider.dart';
import '../main.dart';

class MyBaby extends StatefulWidget {
  final AmmiUser currentAmmiUser;
  MyBaby({@required this.currentAmmiUser});
  @override
  _MyBabyState createState() => _MyBabyState();
}

class _MyBabyState extends State<MyBaby> {
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
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Color.fromRGBO(247, 203, 175, 1),
        title: Align(
            alignment: Alignment.center,
            child: Text(
              "My Baby",
              style: TextStyle(color: Colors.black, fontSize: 25, letterSpacing: 2, fontWeight: FontWeight.w300),
            )),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(8, 25, 8, 0),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Image.asset(
                  "assets/cute-baby.png",
                  scale: 1.5,
                ),
                Padding(
                  padding: EdgeInsets.all(30),
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        Text(
                          "Name:",
                          style: TextStyle(fontSize: 20),
                        ),
                        Spacer(),
                        Text(
                          widget.currentAmmiUser.babyName,
                          style: TextStyle(fontSize: 20),
                        )
                      ],
                    )),
                Padding(
                  padding: EdgeInsets.all(10),
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        Text(
                          "Age:",
                          style: TextStyle(fontSize: 20),
                        ),
                        Spacer(),
                        Text(
                          (DateTime.now().difference(widget.currentAmmiUser.babyDateOfBirth).inDays ~/ 365).toString(),
                          style: TextStyle(fontSize: 20),
                        )
                      ],
                    )),
                Padding(
                  padding: EdgeInsets.all(20),
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        Text(
                          "Vaccines Remaining:",
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                        Spacer(),
                        Text(
                          "6",
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                        )
                      ],
                    )),
                Padding(
                  padding: EdgeInsets.all(20),
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Vaccine1",
                      style: TextStyle(fontSize: 20),
                    )),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Vaccine2",
                      style: TextStyle(fontSize: 20),
                    )),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Vaccine3",
                      style: TextStyle(fontSize: 20),
                    )),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Vaccine4",
                      style: TextStyle(fontSize: 20),
                    )),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Vaccine5",
                      style: TextStyle(fontSize: 20),
                    )),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Vaccine6",
                      style: TextStyle(fontSize: 20),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
