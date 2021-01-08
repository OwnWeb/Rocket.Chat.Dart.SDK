// GENERATED CODE - DO NOT MODIFY BY HAND

part of models;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Channel _$ChannelFromJson(Map<String, dynamic> json) {
  return Channel()
    ..id = json['_id'] as String
    ..name = json['name'] as String
    ..fName = json['fname'] as String
    ..type = json['t'] as String
    ..msgs = json['msgs'] as int
    ..readOnly = json['ro'] as bool
    ..sysMes = _fromJsonSysMes(json['sysMes'])
    ..isDefault = json['default'] as bool
    ..broadcast = json['broadcast'] as bool
    ..timestamp = _fromJsonToDateTime(json['ts'])
    ..updatedAt = _fromJsonToDateTime(json['_updatedAt'])
    ..topic = json['topic'] as String
    ..description = json['description'] as String
    ..avatarETag = _parseToStringIfInt(json['avatarETag'])
    ..user = json['u'] == null
        ? null
        : User.fromJson(json['u'] as Map<String, dynamic>)
    ..lastMessage = json['lastMessage'] == null
        ? null
        : Message.fromJson(json['lastMessage'] as Map<String, dynamic>)
    ..usersCount = json['usersCount'] as int ?? 0
    ..usernames =
        (json['usernames'] as List)?.map((e) => e as String)?.toList();
}

Map<String, dynamic> _$ChannelToJson(Channel instance) {
  final val = <String, dynamic>{
    '_id': instance.id,
    'name': instance.name,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('fname', instance.fName);
  val['t'] = instance.type;
  val['msgs'] = instance.msgs;
  writeNotNull('ro', instance.readOnly);
  writeNotNull('sysMes', instance.sysMes);
  val['default'] = instance.isDefault;
  writeNotNull('broadcast', instance.broadcast);
  writeNotNull('ts', instance.timestamp?.toIso8601String());
  writeNotNull('_updatedAt', instance.updatedAt?.toIso8601String());
  val['topic'] = instance.topic;
  val['description'] = instance.description;
  val['avatarETag'] = instance.avatarETag;
  writeNotNull('u', instance.user?.toJson());
  writeNotNull('lastMessage', instance.lastMessage?.toJson());
  val['usersCount'] = instance.usersCount;
  val['usernames'] = instance.usernames;
  return val;
}

ChannelSubscription _$ChannelSubscriptionFromJson(Map<String, dynamic> json) {
  return ChannelSubscription()
    ..id = json['_id'] as String
    ..alert = json['alert'] as bool
    ..name = json['name'] as String
    ..displayName = json['fname'] as String
    ..open = json['open'] as bool
    ..roomId = json['rid'] as String
    ..prid = json['prid'] as String
    ..type = json['t'] as String
    ..user = json['u'] == null
        ? null
        : User.fromJson(json['u'] as Map<String, dynamic>)
    ..roles = (json['roles'] as List)?.map((e) => e as String)?.toList()
    ..unread = json['unread'] as int
    ..userMentions = json['userMentions'] as int
    ..groupMentions = json['groupMentions'] as int
    ..ts = _fromJsonToDateTime(json['ts'])
    ..ls = _fromJsonToDateTime(json['ls'])
    ..updatedAt = _fromJsonToDateTime(json['updatedAt'])
    ..desktopNotifications = _$enumDecodeNullable(
            _$NotificationStatusEnumMap, json['desktopNotifications']) ??
        NotificationStatus.DEFAULT
    ..disableNotifications = json['disableNotifications'] as bool ?? false
    ..emailNotifications = _$enumDecodeNullable(
            _$NotificationStatusEnumMap, json['emailNotifications']) ??
        NotificationStatus.DEFAULT
    ..audioNotifications = _$enumDecodeNullable(
            _$NotificationStatusEnumMap, json['audioNotifications']) ??
        NotificationStatus.DEFAULT
    ..mobilePushNotifications = _$enumDecodeNullable(
            _$NotificationStatusEnumMap, json['mobilePushNotifications']) ??
        NotificationStatus.DEFAULT
    ..audioNotificationValue =
        json['audioNotificationValue'] as String ?? 'beep'
    ..desktopNotificationDuration =
        json['desktopNotificationDuration'] as int ?? 0;
}

Map<String, dynamic> _$ChannelSubscriptionToJson(ChannelSubscription instance) {
  final val = <String, dynamic>{
    '_id': instance.id,
    'alert': instance.alert,
    'name': instance.name,
    'fname': instance.displayName,
    'open': instance.open,
    'rid': instance.roomId,
    'prid': instance.prid,
    't': instance.type,
    'u': instance.user?.toJson(),
    'roles': instance.roles,
    'unread': instance.unread,
    'userMentions': instance.userMentions,
    'groupMentions': instance.groupMentions,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ts', instance.ts?.toIso8601String());
  writeNotNull('ls', instance.ls?.toIso8601String());
  writeNotNull('updatedAt', instance.updatedAt?.toIso8601String());
  val['desktopNotifications'] =
      _$NotificationStatusEnumMap[instance.desktopNotifications];
  val['disableNotifications'] = _toJsonBool(instance.disableNotifications);
  val['emailNotifications'] =
      _$NotificationStatusEnumMap[instance.emailNotifications];
  val['audioNotifications'] =
      _$NotificationStatusEnumMap[instance.audioNotifications];
  val['mobilePushNotifications'] =
      _$NotificationStatusEnumMap[instance.mobilePushNotifications];
  val['audioNotificationValue'] = instance.audioNotificationValue;
  val['desktopNotificationDuration'] = instance.desktopNotificationDuration;
  return val;
}

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$NotificationStatusEnumMap = {
  NotificationStatus.NOTHING: 'nothing',
  NotificationStatus.ALL: 'all',
  NotificationStatus.MENTIONS: 'mentions',
  NotificationStatus.DEFAULT: 'default',
};

Pagination _$PaginationFromJson(Map<String, dynamic> json) {
  return Pagination()
    ..count = json['count'] as int
    ..offset = json['offset'] as int
    ..total = json['total'] as int;
}

Map<String, dynamic> _$PaginationToJson(Pagination instance) =>
    <String, dynamic>{
      'count': instance.count,
      'offset': instance.offset,
      'total': instance.total,
    };

RoomMessageHistory _$RoomMessageHistoryFromJson(Map<String, dynamic> json) {
  return RoomMessageHistory()
    ..unreadNotLoaded = json['unreadNotLoaded'] as int
    ..messages = (json['messages'] as List)
        ?.map((e) =>
            e == null ? null : Message.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$RoomMessageHistoryToJson(RoomMessageHistory instance) =>
    <String, dynamic>{
      'unreadNotLoaded': instance.unreadNotLoaded,
      'messages': instance.messages,
    };

Message _$MessageFromJson(Map<String, dynamic> json) {
  return Message()
    ..id = json['_id'] as String
    ..roomId = json['rid'] as String
    ..token = json['token'] as String
    ..msg = json['msg'] as String
    ..editedBy = json['editedBy'] == null
        ? null
        : User.fromJson(json['editedBy'] as Map<String, dynamic>)
    ..groupable = json['groupable'] as bool
    ..editedAt = _fromJsonToDateTime(json['editedAt'])
    ..timestamp = _fromJsonToDateTime(json['ts'])
    ..type = json['t'] as String
    ..updatedAt = _fromJsonToDateTime(json['_updatedAt'])
    ..mentions = (json['mentions'] as List)
        ?.map(
            (e) => e == null ? null : User.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..user = json['u'] == null
        ? null
        : User.fromJson(json['u'] as Map<String, dynamic>)
    ..attachments = (json['attachments'] as List)
        ?.map((e) =>
            e == null ? null : Attachment.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..postMessage = json['postMessage'] == null
        ? null
        : PostMessage.fromJson(json['postMessage'] as Map<String, dynamic>)
    ..reactions = (json['reactions'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k,
          e == null ? null : ReactionItem.fromJson(e as Map<String, dynamic>)),
    )
    ..drid = json['drid'] as String;
}

Map<String, dynamic> _$MessageToJson(Message instance) {
  final val = <String, dynamic>{
    '_id': instance.id,
    'rid': instance.roomId,
    'token': instance.token,
    'msg': instance.msg,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('editedBy', instance.editedBy?.toJson());
  writeNotNull('groupable', instance.groupable);
  writeNotNull('editedAt', instance.editedAt?.toIso8601String());
  writeNotNull('ts', instance.timestamp?.toIso8601String());
  val['t'] = instance.type;
  writeNotNull('_updatedAt', instance.updatedAt?.toIso8601String());
  writeNotNull(
      'mentions', instance.mentions?.map((e) => e?.toJson())?.toList());
  writeNotNull('u', instance.user?.toJson());
  writeNotNull(
      'attachments', instance.attachments?.map((e) => e?.toJson())?.toList());
  writeNotNull('postMessage', instance.postMessage?.toJson());
  writeNotNull(
      'reactions', instance.reactions?.map((k, e) => MapEntry(k, e?.toJson())));
  writeNotNull('drid', instance.drid);
  return val;
}

ReactionItem _$ReactionItemFromJson(Map<String, dynamic> json) {
  return ReactionItem()
    ..usernames =
        (json['usernames'] as List)?.map((e) => e as String)?.toList();
}

Map<String, dynamic> _$ReactionItemToJson(ReactionItem instance) =>
    <String, dynamic>{
      'usernames': instance.usernames,
    };

PostMessage _$PostMessageFromJson(Map<String, dynamic> json) {
  return PostMessage()
    ..roomId = json['roomId'] as String
    ..channel = json['channel'] as String
    ..text = json['text'] as String
    ..parseUrls = json['parseUrls'] as bool
    ..alias = json['alias'] as String
    ..emoji = json['emoji'] as String
    ..avatar = json['avatar'] as String
    ..attachments = (json['attachments'] as List)
        ?.map((e) =>
            e == null ? null : Attachment.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$PostMessageToJson(PostMessage instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('roomId', instance.roomId);
  writeNotNull('channel', instance.channel);
  writeNotNull('text', instance.text);
  writeNotNull('parseUrls', instance.parseUrls);
  writeNotNull('alias', instance.alias);
  writeNotNull('emoji', instance.emoji);
  writeNotNull('avatar', instance.avatar);
  val['attachments'] = instance.attachments;
  return val;
}

Attachment _$AttachmentFromJson(Map<String, dynamic> json) {
  return Attachment()
    ..color = json['color'] as String
    ..text = json['text'] as String
    ..timestamp = _fromJsonToDateTime(json['ts'])
    ..thumbUrl = json['thumb_url'] as String
    ..messageLink = json['message_link'] as String
    ..collapsed = json['collapsed'] as bool
    ..authorName = json['author_name'] as String
    ..authorLink = json['author_link'] as String
    ..authorIcon = json['author_icon'] as String
    ..title = json['title'] as String
    ..titleLink = json['title_link'] as String
    ..titleLinkDownload = json['title_link_download'] as bool
    ..imageUrl = json['image_url'] as String
    ..audioUrl = json['audio_url'] as String
    ..videoUrl = json['video_url'] as String
    ..fields = (json['fields'] as List)
        ?.map((e) => e == null
            ? null
            : AttachmentField.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$AttachmentToJson(Attachment instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('color', instance.color);
  writeNotNull('text', instance.text);
  writeNotNull('ts', instance.timestamp?.toIso8601String());
  writeNotNull('thumb_url', instance.thumbUrl);
  writeNotNull('message_link', instance.messageLink);
  writeNotNull('collapsed', instance.collapsed);
  writeNotNull('author_name', instance.authorName);
  writeNotNull('author_link', instance.authorLink);
  writeNotNull('author_icon', instance.authorIcon);
  writeNotNull('title', instance.title);
  writeNotNull('title_link', instance.titleLink);
  writeNotNull('title_link_download', instance.titleLinkDownload);
  writeNotNull('image_url', instance.imageUrl);
  writeNotNull('audio_url', instance.audioUrl);
  writeNotNull('video_url', instance.videoUrl);
  writeNotNull('fields', instance.fields);
  return val;
}

AttachmentField _$AttachmentFieldFromJson(Map<String, dynamic> json) {
  return AttachmentField()
    ..short = json['short'] as bool
    ..title = json['title'] as String
    ..value = json['value'] as String;
}

Map<String, dynamic> _$AttachmentFieldToJson(AttachmentField instance) =>
    <String, dynamic>{
      'short': instance.short,
      'title': instance.title,
      'value': instance.value,
    };

NotificationPreferences _$NotificationPreferencesFromJson(
    Map<String, dynamic> json) {
  return NotificationPreferences()
    ..desktopNotifications = _$enumDecodeNullable(
            _$NotificationStatusEnumMap, json['desktopNotifications']) ??
        NotificationStatus.DEFAULT
    ..disableNotifications = json['disableNotifications'] as bool ?? false
    ..emailNotifications = _$enumDecodeNullable(
            _$NotificationStatusEnumMap, json['emailNotifications']) ??
        NotificationStatus.DEFAULT
    ..audioNotifications = _$enumDecodeNullable(
            _$NotificationStatusEnumMap, json['audioNotifications']) ??
        NotificationStatus.DEFAULT
    ..mobilePushNotifications = _$enumDecodeNullable(
            _$NotificationStatusEnumMap, json['mobilePushNotifications']) ??
        NotificationStatus.DEFAULT
    ..audioNotificationValue =
        json['audioNotificationValue'] as String ?? 'beep'
    ..desktopNotificationDuration =
        json['desktopNotificationDuration'] as int ?? 0
    ..unreadAlert =
        _$enumDecodeNullable(_$NotificationStatusEnumMap, json['unreadAlert']) ??
            NotificationStatus.DEFAULT
    ..hideUnreadStatus = json['hideUnreadStatus'] as bool ?? false;
}

Map<String, dynamic> _$NotificationPreferencesToJson(
        NotificationPreferences instance) =>
    <String, dynamic>{
      'desktopNotifications':
          _$NotificationStatusEnumMap[instance.desktopNotifications],
      'disableNotifications': _toJsonBool(instance.disableNotifications),
      'emailNotifications':
          _$NotificationStatusEnumMap[instance.emailNotifications],
      'audioNotifications':
          _$NotificationStatusEnumMap[instance.audioNotifications],
      'mobilePushNotifications':
          _$NotificationStatusEnumMap[instance.mobilePushNotifications],
      'audioNotificationValue': instance.audioNotificationValue,
      'desktopNotificationDuration': instance.desktopNotificationDuration,
      'unreadAlert': _$NotificationStatusEnumMap[instance.unreadAlert],
      'hideUnreadStatus': _toJsonBool(instance.hideUnreadStatus),
    };

User _$UserFromJson(Map<String, dynamic> json) {
  return User()
    ..id = json['_id'] as String
    ..name = json['name'] as String
    ..userName = json['username'] as String
    ..status = json['status'] as String
    ..active = json['active'] as bool
    ..customFields = json['customFields'] as Map<String, dynamic>;
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'username': instance.userName,
      'status': instance.status,
      'active': instance.active,
      'customFields': instance.customFields,
    };

AuthInfo _$AuthInfoFromJson(Map<String, dynamic> json) {
  return AuthInfo()
    ..id = json['_id'] as String
    ..token = json['token'] as String
    ..tokenExpires = json['tokenExpires'] as int;
}

Map<String, dynamic> _$AuthInfoToJson(AuthInfo instance) => <String, dynamic>{
      '_id': instance.id,
      'token': instance.token,
      'tokenExpires': instance.tokenExpires,
    };
