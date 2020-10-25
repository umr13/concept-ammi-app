import 'package:Ammiv1/models/clinic.dart';
import 'package:Ammiv1/models/ammi_notification.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:Ammiv1/models/ammi_user.dart';

class DatabaseService {
  // Singleton stuff
  DatabaseService._privateConstructor();

  static final DatabaseService instance = DatabaseService._privateConstructor();

  // Singleton stuff end

  // Collection reference
  final CollectionReference ammiUserCollection = FirebaseFirestore.instance.collection('amiusers');
  final CollectionReference ammiNotificationCollection = FirebaseFirestore.instance.collection('amminotifications');
  final CollectionReference clinicCollection = FirebaseFirestore.instance.collection('clinics');

  Stream<List<AmmiNotification>> get ammiNotifications {
    return ammiNotificationCollection.orderBy('notificationTime', descending: true).snapshots().map(_ammiNotificationsFromSnapshot);
  }

  Stream<List<Clinic>> get clinics {
    return clinicCollection.snapshots().map(_clinicsFromSnapshot);
  }

  Stream<List<AmmiUser>> get ammiUsers {
    return ammiUserCollection.orderBy('createdAt', descending: true).snapshots().map(_ammiUsersListFromSnapshot);
  }

  Future<AmmiUser> createAmmiUser(
    final String uid,
    final String email,
    final String babyName,
    final DateTime babyDateOfBirth,
    final bool isVaccinated,
    final Map<String, bool> vaccinations,
  ) async {
    AmmiUser ammiUser = AmmiUser(
      uid: uid,
      email: email,
      babyName: babyName,
      babyDateOfBirth: babyDateOfBirth,
      isVaccinated: isVaccinated,
      vaccinations: vaccinations,
      createdAt: DateTime.now(),
    );
    await ammiUserCollection.doc(uid).set(ammiUser.toJson());
    return ammiUser;
  }

  Future<AmmiUser> getAmmiUser(String uid) async {
    DocumentSnapshot result = await ammiUserCollection.doc(uid).get();
    if (!result.exists) {
      print(result);
      print(result.id);
      throw "AmmiUser does not exist";
    }

    return AmmiUser.fromJson(result.data());
  }

  List<AmmiNotification> _ammiNotificationsFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return AmmiNotification.fromJson(doc.data());
    }).toList();
  }

  List<Clinic> _clinicsFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Clinic.fromJson(doc.data());
    }).toList();
  }

  List<AmmiUser> _ammiUsersListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return AmmiUser.fromJson(doc.data());
    }).toList();
  }
}
