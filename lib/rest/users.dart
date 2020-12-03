part of rest;

abstract class _ClientUsersMixin implements _ClientWrapper {
  Future<void> login(UserCredentials credentials) {
    Completer<void> completer = Completer();
    Map<String, String> body = {};

    if (credentials.token != null) {
      body = <String, String>{
        'resume': credentials.token,
      };
    } else {
      body = <String, String>{
        'user': credentials.name ?? credentials.email,
        'password': credentials.password,
      };
    }

    http
        .post('${_getUrl()}/login',
            headers: {
              'Content-Type': 'application/json',
            },
            body: json.encode(body))
        .then((response) {
      _hackResponseHeader(response);
      final data = json.decode(response.body)['data'];
      this._auth = _AuthInfo(data['userId'], data['authToken']);
      completer.complete(null);
    }).catchError((error) => completer.completeError(error));
    return completer.future;
  }

  Future<void> logout() {
    Completer<void> completer = Completer();

    http.post('${_getUrl()}/logout', headers: {
      'Content-Type': 'application/json',
    }).then((response) {
      this._auth = null;
      completer.complete(null);
    }).catchError((error) => completer.completeError(error));
    return completer.future;
  }

  setCredentials(UserCredentials credentials) {
    this._auth = _AuthInfo(credentials.id, credentials.token);
  }

  // savePushToken stores a push token and returns its id
  Future<String> savePushToken(
      String id, String token, String type, String appName) {
    Completer<String> completer = Completer();
    http
        .post('${_getUrl()}/push.token',
            headers: {
              'Content-Type': 'application/json',
              'X-User-Id': _auth._id,
              'X-Auth-Token': _auth._token,
            },
            body: json.encode(<String, String>{
              'id': id,
              'type': type,
              'value': token,
              'appName': appName,
            }))
        .then((response) {
      _hackResponseHeader(response);
      final data = json.decode(response.body)['result']['_id'];
      completer.complete(data);
    }).catchError((error) => completer.completeError(error));
    return completer.future;
  }

  // savePushToken stores a push token and returns its id
  Future<void> setAvatar(File file) {
    Completer<void> completer = Completer();
    http.MultipartRequest('POST', Uri.parse('${_getUrl()}/users.setAvatar'))
      ..headers['X-User-Id'] = _auth._id
      ..headers['X-Auth-Token'] = _auth._token
      ..files.add(http.MultipartFile.fromBytes('image', file.readAsBytesSync()))
      ..send().then((response) {
        if (response.statusCode == 200) {
          completer.complete();
        } else {
          completer.completeError(
              HttpException(response.reasonPhrase, uri: response.request.url));
        }
      }).catchError((error) => completer.completeError(error));
    return completer.future;
  }
}
