import 'package:Ammiv1/ui/signup.dart';
import 'package:Ammiv1/models/ammi_user.dart';
import 'package:Ammiv1/services/database.dart';
import 'package:Ammiv1/ui/router.dart' as router;
import 'package:Ammiv1/ui/home.dart';
import 'package:Ammiv1/ui/splash.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Return home or authenticate

    return StreamBuilder<User>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            User user = snapshot.data;
            if (user == null) {
              return SignupPage();
            }

            return FutureBuilder(
                future: DatabaseService.instance.getAmmiUser(user.uid),
                builder: (BuildContext context, AsyncSnapshot<AmmiUser> snapshot) {
                  if (snapshot.hasError) {
                    return SignupPage();
                    // throw "snapshot.hasError";
                  }

                  if (snapshot.connectionState == ConnectionState.done) {
                    AmmiUser user = snapshot.data;

                    return HomeScreen(
                      currentAmmiUser: user,
                    );
                  } else {
                    return Splash();
                  }
                });
          } else {
            return Splash();
          }
        });
  }
}
