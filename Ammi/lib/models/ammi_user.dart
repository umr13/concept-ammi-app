import 'package:Ammiv1/services/database.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ammi_user.g.dart';

@JsonSerializable()
class AmmiUser {
  final String uid;
  final DateTime createdAt;

  final String email;
  final String babyName;
  final DateTime babyDateOfBirth;
  final bool isVaccinated;
  final Map<String, bool> vaccinations;

  AmmiUser({
    this.uid,
    @required this.email,
    @required this.babyDateOfBirth,
    @required this.babyName,
    @required this.isVaccinated,
    @required this.vaccinations,
    @required this.createdAt,
  });

  factory AmmiUser.fromJson(Map<String, dynamic> json) => _$AmmiUserFromJson(json);
  Map<String, dynamic> toJson() => _$AmmiUserToJson(this);

  Future<void> updateAmmiUserData(Map<String, String> data) async {
    await DatabaseService.instance.ammiUserCollection.doc(uid).update(data);
  }
}
