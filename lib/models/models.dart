library models;

import 'package:json_annotation/json_annotation.dart';

part 'channel.dart';
part 'info.dart';
part 'message.dart';
part 'models.g.dart';
part 'notification_preferences.dart';
part 'permissons.dart';
part 'user.dart';
part 'user_credentials.dart';

DateTime _fromJsonToDateTime(dynamic field) {
  if (field.runtimeType == String) {
    return DateTime.parse(field);
  }
  if (field is Map) {
    return DateTime.fromMillisecondsSinceEpoch(field['\$date'], isUtc: true);
  }
  return null;
}

String _toJsonBool(bool value) => value == true ? '1' : '0';

Map<String, int> DateTimeToMap(DateTime dt) {
  var r = Map<String, int>();
  r["\$date"] = dt.millisecondsSinceEpoch;
  return r;
}

List<String> _fromJsonSysMes(dynamic field) {
  if (field is List) return field.cast<String>();

  return [field.toString()] as List<String>;
}
