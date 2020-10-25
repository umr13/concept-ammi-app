// ignore: unused_import
import 'dart:developer';

import 'package:Ammiv1/models/ammi_user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:Ammiv1/services/database.dart';

class AuthService {
  // Singleton stuff
  AuthService._privateConstructor();

  static final AuthService instance = AuthService._privateConstructor();

  // Singleton stuff end

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final DatabaseService databaseService = DatabaseService.instance;

  Future<AmmiUser> createNewAmmiUser(
    final String email,
    final String babyName,
    final DateTime babyDateOfBirth,
    final bool isVaccinated,
    final Map<String, bool> vaccinations,
  ) async {
    try {
      print("signingIn");
      await _auth.signInAnonymously();
      print("done signingIn");
      String uid = FirebaseAuth.instance.currentUser.uid;
      return await DatabaseService.instance.createAmmiUser(uid, email, babyName, babyDateOfBirth, isVaccinated, vaccinations);
    } catch (e) {
      print("error signin anonymously");
      rethrow;
    }
  }

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
