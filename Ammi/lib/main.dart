import 'package:Ammiv1/ui/wrapper.dart';
import 'package:Ammiv1/ui/signup.dart';
import 'package:Ammiv1/ui/clinic_rating.dart';
import 'package:Ammiv1/ui/online_appointment.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:Ammiv1/ui/router.dart' as router;
import 'package:Ammiv1/ui/splash.dart';
import 'package:Ammiv1/ui/home.dart';
import 'package:Ammiv1/ui/baby.dart';
import 'package:Ammiv1/ui/video.dart';
import 'package:Ammiv1/ui/chat.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  final router.Router _router = router.Router.instance;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) return CircularProgressIndicator();
        return MaterialApp(
          title: 'AMMI',
          initialRoute: _router.WRAPPER,
          routes: {
            _router.WRAPPER: (context) => Wrapper(),
            _router.SIGNUP: (context) => SignupPage(),
            _router.HOME: (context) => HomeScreen(),
            _router.SPLASH: (context) => Splash(),
            _router.BOOKING: (context) => OnlineAppointment(),
            _router.BABY: (context) => MyBaby(),
            _router.CLINIC: (context) => ClinicRating(),
            _router.VIDEO: (context) => Video(),
            _router.CHAT: (context) => Chat(),
          },
        );
      },
    );
  }
}
