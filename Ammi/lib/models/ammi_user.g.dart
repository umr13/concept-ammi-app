// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ammi_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AmmiUser _$AmmiUserFromJson(Map<String, dynamic> json) {
  return AmmiUser(
    uid: json['uid'] as String,
    email: json['email'] as String,
    babyDateOfBirth: json['babyDateOfBirth'] == null
        ? null
        : DateTime.parse(json['babyDateOfBirth'] as String),
    babyName: json['babyName'] as String,
    isVaccinated: json['isVaccinated'] as bool,
    vaccinations: (json['vaccinations'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as bool),
    ),
    createdAt: json['createdAt'] == null
        ? null
        : DateTime.parse(json['createdAt'] as String),
  );
}

Map<String, dynamic> _$AmmiUserToJson(AmmiUser instance) => <String, dynamic>{
      'uid': instance.uid,
      'createdAt': instance.createdAt?.toIso8601String(),
      'email': instance.email,
      'babyName': instance.babyName,
      'babyDateOfBirth': instance.babyDateOfBirth?.toIso8601String(),
      'isVaccinated': instance.isVaccinated,
      'vaccinations': instance.vaccinations,
    };
