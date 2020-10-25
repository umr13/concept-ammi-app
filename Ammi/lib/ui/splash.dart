import 'package:flutter/material.dart';
import 'package:Ammiv1/ui/router.dart' as router;
import 'package:flutter/painting.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
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
      body: Container(
        color: Color.fromRGBO(247, 203, 175, 1),
        child: Center(
          child: Stack(
            children: <Widget>[
              Align(
                  child: Image.asset(
                "assets/ammilogo.png",
                scale: 2,
              )),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text("Powered by Scaryammi"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
