part of models;

@JsonSerializable(explicitToJson: true)
class User {
  User();

  @JsonKey(name: '_id')
  String id;

  String name;

  @JsonKey(name: 'username')
  String userName;

  String status;

  String statusConnection;

  bool active;

  List<UserEmail> emails;

  List<String> roles;

  Map<String, dynamic> customFields;

  String avatarETag;

  String avatarUrl;

  String avatarOrigin;

  UserSettings settings;

  int utcOffset;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}

@JsonSerializable()
class AuthInfo {
  AuthInfo();

  @JsonKey(name: '_id')
  String id;

  String token;

  int tokenExpires;
}

@JsonSerializable()
class UserEmail {
  UserEmail();

  String address;

  bool verified;

  factory UserEmail.fromJson(Map<String, dynamic> json) =>
      _$UserEmailFromJson(json);

  Map<String, dynamic> toJson() => _$UserEmailToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UserPreferences {
  UserPreferences();

  /// Configures the notification sound when a new room is created/joined.
  String newRoomNotification;

  /// Lets you select the notification for new messages.
  String newMessageNotification;

  /// When set to true, no notification will be sent for focused/open conversations
  bool muteFocusedConversations;

  /// Setting this to false will disable the use of emojis.
  bool useEmojis;

  /// When this is true, ASCII characters will be converted to emoji.
  bool convertAsciiEmoji;

  /// When enabled acts like a data saver.
  bool saveMobileBandwidth;

  /// Setting this to true will cause embedded media cards to collapse.
  bool collapseMediaByDefault;

  /// Seting this to false will prevent images from auto loading when a room/chat is opened.
  bool autoImageLoad;

  /// Lets you set when users should recieve email notifications.
  String emailNotificationMode;

  String roomsListExhibitionMode;

  /// Setting this to false will stop the unread tray icon from displaying.
  bool unreadAlert;

  /// Lets you set the notification volume between 0 and 100
  int notificationsSoundVolume;

  /// Lets you set when the desktop notificaion alert is triggered. Default is All messages. THis only concerns the groups and channels the user belongs to.
  String desktopNotifications;

  /// Sets when the default notification alert will play on mobile devices.
  String mobileNotifications;

  /// When set to True, it will automatically change the User's status to Away they exit Rocket.Chat.
  bool enableAutoAway;

  List<dynamic> highlights;

  /// This will set how long in miliseconds for a notification to be displayed.
  int desktopNotificationDuration;

  /// Enabling this will set the notification prompt active untill the User interacts with it.
  bool desktopNotificationRequireInteraction;

  /// Lets you select how message boxes appear.
  int viewMode;

  /// When enabled, it'll hind usernames in conversation rooms.
  bool hideUsernames;

  /// When set to true, user roles like admin, moderator will not be shown in chat rooms.
  bool hideRoles;

  /// Enabling this will make users avatar not to show in chat.
  bool hideAvatars;

  bool hideFlexTab;

  ///  Let's you configure the action of the Enter key.
  String sendOnEnter;

  bool roomCounterSidebar;

  factory UserPreferences.fromJson(Map<String, dynamic> json) =>
      _$UserPreferencesFromJson(json);

  Map<String, dynamic> toJson() => _$UserPreferencesToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UserSettings {
  UserSettings();

  UserPreferences preferences;

  factory UserSettings.fromJson(Map<String, dynamic> json) =>
      _$UserSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$UserSettingsToJson(this);
}
