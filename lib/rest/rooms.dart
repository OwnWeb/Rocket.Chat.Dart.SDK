part of rest;

abstract class _ClientRoomsMixin implements _ClientWrapper {
  Future<List<Channel>> getRooms() {
    Completer<List<Channel>> completer = Completer();
    http.get('${_getUrl()}/rooms.get', headers: {
      'X-User-Id': _auth.id,
      'X-Auth-Token': _auth.token,
    }).then((response) {
      _hackResponseHeader(response);
      final rawRoomsList = json.decode(response.body)['update'] as List;
      final rooms = <Channel>[];
      for (var raw in rawRoomsList) {
        rooms.add(Channel.fromJson(raw));
      }
      completer.complete(rooms);
    }).catchError((error) => completer.completeError(error));
    return completer.future;
  }

  Future<Channel> roomsInfo(String roomId) {
    Completer<Channel> completer = Completer();
    http.get('${_getUrl()}/rooms.info?roomId=${roomId}', headers: {
      'X-User-Id': _auth.id,
      'X-Auth-Token': _auth.token
    }).then((response) {
      _hackResponseHeader(response);
      if (response.statusCode == 200) {
        completer
            .complete(Channel.fromJson(json.decode(response.body)['room']));
      } else {
        completer.completeError(HttpException(response.reasonPhrase));
      }
    }).catchError((error) => completer.completeError(error));
    return completer.future;
  }

  Future<void> saveNotification(
      String roomId, NotificationPreferences preferences) async {
    Completer<void> completer = Completer();
    final body = json.encode(<String, dynamic>{
      'roomId': roomId,
      'notifications': preferences.toJson()
        ..removeWhere((key, value) => value == null)
    });

    print(body);

    http
        .post('${_getUrl()}/rooms.saveNotification',
            headers: {
              'X-User-Id': _auth.id,
              'X-Auth-Token': _auth.token,
              'Content-Type': 'application/json',
            },
            body: body)
        .then((response) {
      _hackResponseHeader(response);
      if (response.statusCode == 200) {
        completer.complete();
      } else {
        completer.completeError(HttpException(response.reasonPhrase));
      }
    }).catchError((error) => completer.completeError(error));

    return completer.future;
  }
}
