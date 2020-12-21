part of models;

@JsonSerializable()
class Channel {
  Channel();

  @JsonKey(name: '_id')
  String id;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'fname', includeIfNull: false)
  String fName;

  @JsonKey(name: 't')
  String type;

  @JsonKey(name: 'msgs')
  int msgs;

  @JsonKey(name: 'ro', includeIfNull: false)
  bool readOnly;

  // starting from 3.0.3, sysmes is definable per room
  // see https://github.com/RocketChat/Rocket.Chat/pull/16369
  @JsonKey(name: 'sysMes', includeIfNull: false)
  List<String> sysMes;

  @JsonKey(name: 'default')
  bool isDefault;

  @JsonKey(name: 'broadcast', includeIfNull: false)
  bool broadcast;

  @JsonKey(name: 'ts', includeIfNull: false, fromJson: _fromJsonToDateTime)
  DateTime timestamp;

  @JsonKey(
    name: '_updatedAt',
    includeIfNull: false,
    fromJson: _fromJsonToDateTime,
  )
  DateTime updatedAt;

  @JsonKey(name: 'topic')
  String topic;

  @JsonKey(name: 'description')
  String description;

  @JsonKey(name: 'u', includeIfNull: false)
  User user;

  @JsonKey(name: 'lastMessage', includeIfNull: false)
  Message lastMessage;

  @JsonKey(name: "usersCount", includeIfNull: true, defaultValue: 0)
  int usersCount;

  @JsonKey(name: "usernames")
  List<String> usernames;

  factory Channel.fromJson(Map<String, dynamic> json) =>
      _$ChannelFromJson(json);

  Map<String, dynamic> toJson() => _$ChannelToJson(this);
}

@JsonSerializable()
class ChannelSubscription {
  ChannelSubscription();

  @JsonKey(name: '_id')
  String id;

  @JsonKey(name: 'alert')
  bool alert;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'fname')
  String displayName;

  @JsonKey(name: 'open')
  bool open;

  @JsonKey(name: 'rid')
  String roomId;

  @JsonKey(name: 'prid')
  String prid;

  @JsonKey(name: 't')
  String type;

  @JsonKey(name: 'u')
  User user;

  @JsonKey(name: 'roles')
  List<String> roles;

  @JsonKey(name: 'unread')
  int unread;

  @JsonKey(name: 'userMentions')
  int userMentions;

  @JsonKey(name: 'groupMentions')
  int groupMentions;

  @JsonKey(name: 'ts', includeIfNull: false, fromJson: _fromJsonToDateTime)
  DateTime ts;

  @JsonKey(name: 'ls', includeIfNull: false, fromJson: _fromJsonToDateTime)
  DateTime ls;

  @JsonKey(
      name: 'updatedAt', includeIfNull: false, fromJson: _fromJsonToDateTime)
  DateTime updatedAt;

  factory ChannelSubscription.fromJson(Map<String, dynamic> json) =>
      _$ChannelSubscriptionFromJson(json);

  Map<String, dynamic> toJson() => _$ChannelSubscriptionToJson(this);
}
