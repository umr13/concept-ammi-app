// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ammi_notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AmmiNotification _$AmmiNotificationFromJson(Map<String, dynamic> json) {
  return AmmiNotification(
    notificationText: json['notificationText'] as String,
    notificationTime: json['notificationTime'] == null
        ? null
        : DateTime.parse(json['notificationTime'] as String),
  );
}

Map<String, dynamic> _$AmmiNotificationToJson(AmmiNotification instance) =>
    <String, dynamic>{
      'notificationText': instance.notificationText,
      'notificationTime': instance.notificationTime?.toIso8601String(),
    };
