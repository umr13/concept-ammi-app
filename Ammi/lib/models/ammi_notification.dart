import 'package:json_annotation/json_annotation.dart';

part 'ammi_notification.g.dart';

@JsonSerializable()
class AmmiNotification {
  final String notificationText;
  final DateTime notificationTime;

  AmmiNotification({this.notificationText, this.notificationTime});

  factory AmmiNotification.fromJson(Map<String, dynamic> json) => _$AmmiNotificationFromJson(json);
  Map<String, dynamic> toJson() => _$AmmiNotificationToJson(this);
}
