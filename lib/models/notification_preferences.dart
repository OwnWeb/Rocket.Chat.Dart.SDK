part of models;

enum NotificationStatus {
  @JsonValue('nothing')
  NOTHING,
  @JsonValue('all')
  ALL,
  @JsonValue('mentions')
  MENTIONS,
  @JsonValue('default')
  DEFAULT
}

@JsonSerializable()
class NotificationPreferences {
  NotificationPreferences();

  @JsonKey(
      name: 'desktopNotifications', defaultValue: NotificationStatus.DEFAULT)
  NotificationStatus desktopNotifications;

  @JsonKey(
      name: 'disableNotifications', defaultValue: false, toJson: _toJsonBool)
  bool disableNotifications;

  @JsonKey(name: 'emailNotifications', defaultValue: NotificationStatus.DEFAULT)
  NotificationStatus emailNotifications;

  @JsonKey(name: 'audioNotifications', defaultValue: NotificationStatus.DEFAULT)
  NotificationStatus audioNotifications;

  @JsonKey(
      name: 'mobilePushNotifications', defaultValue: NotificationStatus.DEFAULT)
  NotificationStatus mobilePushNotifications;

  @JsonKey(name: 'audioNotificationValue', defaultValue: 'beep')
  String audioNotificationValue;

  @JsonKey(name: 'desktopNotificationDuration', defaultValue: 0)
  int desktopNotificationDuration;

  @JsonKey(name: 'unreadAlert', defaultValue: NotificationStatus.DEFAULT)
  NotificationStatus unreadAlert;

  @JsonKey(name: 'hideUnreadStatus', defaultValue: false, toJson: _toJsonBool)
  bool hideUnreadStatus;

  factory NotificationPreferences.fromJson(Map<String, dynamic> json) =>
      _$NotificationPreferencesFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationPreferencesToJson(this);
}
