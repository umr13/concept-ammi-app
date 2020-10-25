// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clinic.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Clinic _$ClinicFromJson(Map<String, dynamic> json) {
  return Clinic(
    name: json['name'] as String,
    rating: (json['rating'] as num)?.toDouble(),
    location: json['location'] as String,
  );
}

Map<String, dynamic> _$ClinicToJson(Clinic instance) => <String, dynamic>{
      'name': instance.name,
      'location': instance.location,
      'rating': instance.rating,
    };
