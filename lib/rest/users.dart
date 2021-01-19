part of rest;

abstract class _ClientUsersMixin implements _ClientWrapper {
  /// Login the user with given credentials
  /// See https://docs.rocket.chat/api/rest-api/methods/authentication/login
  ///
  Future<User> login(UserCredentials credentials) {
    Completer<User> completer = Completer();
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
      this._auth = AuthInfo()
        ..id = data['userId']
        ..token = data['authToken'];
      completer.complete(User.fromJson(data['me']));
    }).catchError((error) => completer.completeError(error));
    return completer.future;
  }

  /// Register an user with given credentials
  /// See https://docs.rocket.chat/api/rest-api/methods/users/register
  ///
  Future<User> register(String email, String password, String username,
      {String name, String secretURL}) {
    Completer<User> completer = Completer();
    Map<String, String> body = <String, String>{
      'email': email,
      'pass': password,
      'username': username,
      'name': name ?? '',
      if (secretURL != null) 'secretURL': secretURL
    };

    http
        .post('${_getUrl()}/users.register',
            headers: {
              'Content-Type': 'application/json',
            },
            body: json.encode(body))
        .then((response) {
      _hackResponseHeader(response);

      final body = json.decode(response.body);

      if (body['success'] == false) {
        return completer.completeError(body['error']);
      }

      completer.complete(User.fromJson(body['user']));
    }).catchError((error) => completer.completeError(error));
    return completer.future;
  }

  /// Updates user informations
  /// See https://docs.rocket.chat/api/rest-api/methods/users/updateownbasicinfo
  ///
  Future<User> updateOwnBasicInfo(
      {String email,
      String username,
      String name,
      String currentPassword,
      String newPassword,
      Map<String, dynamic> customFields}) {
    Completer<User> completer = Completer();
    Map<String, dynamic> body = <String, Map<String, dynamic>>{
      if (customFields != null) 'customFields': customFields,
      'data': {
        'email': email,
        'username': username,
        'name': name,
        'currentPassword': currentPassword,
        'newPassword': newPassword,
      }..removeWhere((key, value) => value == null)
    };

    http
        .post('${_getUrl()}/users.updateOwnBasicInfo',
            headers: {
              'Content-Type': 'application/json',
              'X-User-Id': _auth.id,
              'X-Auth-Token': _auth.token,
            },
            body: json.encode(body))
        .then((response) {
      _hackResponseHeader(response);

      final body = json.decode(response.body);

      if (body['success'] == false) {
        return completer.completeError(body['error']);
      }

      completer.complete(User.fromJson(body['user']));
    }).catchError((error) => completer.completeError(error));
    return completer.future;
  }

  /// Set user preferences
  /// See https://docs.rocket.chat/api/rest-api/methods/users/set-preferences
  ///
  Future<UserPreferences> setUserPreferences(
      {String userId, UserPreferences userPreferences}) {
    Completer<UserPreferences> completer = Completer();

    Map<String, dynamic> body = {
      if (userId != null) 'userId': userId,
      'data': userPreferences.toJson()
        ..removeWhere((key, value) => value == null)
    };

    http
        .post('${_getUrl()}/users.setPreferences',
            headers: {
              'Content-Type': 'application/json',
              'X-User-Id': _auth.id,
              'X-Auth-Token': _auth.token,
            },
            body: json.encode(body))
        .then((response) {
      _hackResponseHeader(response);

      final body = json.decode(response.body);

      if (body['success'] == false) {
        return completer.completeError(body['error']);
      }

      completer.complete(
          UserPreferences.fromJson(body['user']['settings']['preferences']));
    }).catchError((error) => completer.completeError(error));
    return completer.future;
  }

  /// Get user preferences
  /// See https://docs.rocket.chat/api/rest-api/methods/users/get-preferences
  ///
  Future<UserPreferences> getUserPreferences() {
    Completer<UserPreferences> completer = Completer();

    http.get(
      '${_getUrl()}/users.getPreferences',
      headers: {
        'Content-Type': 'application/json',
        'X-User-Id': _auth.id,
        'X-Auth-Token': _auth.token,
      },
    ).then((response) {
      _hackResponseHeader(response);

      final body = json.decode(response.body);

      if (body['success'] == false) {
        return completer.completeError(body['error']);
      }

      completer.complete(UserPreferences.fromJson(body['preferences']));
    }).catchError((error) => completer.completeError(error));
    return completer.future;
  }

  /// Logout user, revoking its current tokens
  /// See https://docs.rocket.chat/api/rest-api/methods/authentication/logout
  ///
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

  /// Set credentials after login
  setCredentials(UserCredentials credentials) {
    this._auth = AuthInfo()
      ..id = credentials.id
      ..token = credentials.token;
  }

  /// savePushToken stores a push token and returns its id
  /// See https://docs.rocket.chat/api/rest-api/methods/push/push-token
  Future<Map<String, dynamic>> savePushToken(
      String token, String type, String appName,
      {String id}) {
    Completer<Map<String, dynamic>> completer = Completer();
    http
        .post('${_getUrl()}/push.token',
            headers: {
              'Content-Type': 'application/json',
              'X-User-Id': _auth.id,
              'X-Auth-Token': _auth.token,
            },
            body: json.encode(<String, String>{
              if (id != null) 'id': id,
              'type': type,
              'value': token,
              'appName': appName,
            }))
        .then((response) {
      _hackResponseHeader(response);
      final data = json.decode(response.body)['result'];
      completer.complete(data);
    }).catchError((error) => completer.completeError(error));
    return completer.future;
  }

  /// removePushToken stores a push token and returns its id
  /// See https://docs.rocket.chat/api/rest-api/methods/push/push-token
  Future<String> deletePushToken(String token) {
    Completer<String> completer = Completer();
    final request = http.Request(
      'DELETE',
      Uri.parse('${_getUrl()}/push.token'),
    );

    request.headers.addAll({
      'Content-Type': 'application/json',
      'X-User-Id': _auth.id,
      'X-Auth-Token': _auth.token,
    });
    request.body = json.encode(<String, String>{
      'token': token,
    });

    request.send().then((response) async {
      completer.complete(
          json.decode(await response.stream.bytesToString())['result']);
    }).catchError((error) => completer.completeError(error));
    return completer.future;
  }

  /// Set user avatar
  /// See https://docs.rocket.chat/api/rest-api/methods/users/setavatar
  ///
  Future<void> setAvatar(File file) {
    Completer<void> completer = Completer();

    final contentType = MediaType.parse(lookupMimeType(file.path));
    final image = http.MultipartFile.fromBytes('image', file.readAsBytesSync(),
        contentType: contentType, filename: 'image');

    http.MultipartRequest('POST', Uri.parse('${_getUrl()}/users.setAvatar'))
      ..headers['X-User-Id'] = _auth.id
      ..headers['X-Auth-Token'] = _auth.token
      ..files.add(image)
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

  ///
  /// Returns an username suggestion based on user name's if provided
  /// See https://docs.rocket.chat/api/rest-api/methods/users/getusernamesuggestion
  ///
  Future<String> getUsernameSuggestion() {
    Completer<String> completer = Completer();

    http.get('${_getUrl()}/users.getUsernameSuggestion', headers: {
      'X-User-Id': _auth.id,
      'X-Auth-Token': _auth.token,
    }).then((response) {
      _hackResponseHeader(response);
      final rawResponse = json.decode(response.body);
      completer.complete(rawResponse['result']);
    }).catchError((error) => completer.completeError(error));
    return completer.future;
  }

  ///
  /// Retrieves information about a user
  /// See https://docs.rocket.chat/api/rest-api/methods/users/info
  ///
  Future<User> getUserInfo({String username, String userId}) {
    assert(userId is String || username is String);

    Completer<User> completer = Completer();

    http.get(
        '${_getUrl()}/users.info?${userId != null ? 'userId=$userId' : 'username=$username'}',
        headers: {
          'X-User-Id': _auth.id,
          'X-Auth-Token': _auth.token,
        }).then((response) {
      _hackResponseHeader(response);

      final body = json.decode(response.body);

      completer
          .complete(body['user'] != null ? User.fromJson(body['user']) : null);
    }).catchError((error) => completer.completeError(error));

    return completer.future;
  }

  ///
  /// Send email to reset your password.
  /// See https://docs.rocket.chat/api/rest-api/methods/users/forgotpassword
  ///
  Future<bool> forgotPassword(String email) {
    Completer<bool> completer = Completer();

    http
        .post('${_getUrl()}/users.forgotPassword',
            headers: {
              'Content-Type': 'application/json',
            },
            body: json.encode(<String, String>{
              'email': email,
            }))
        .then((response) {
      _hackResponseHeader(response);
      final rawResponse = json.decode(response.body);
      if (rawResponse['status'] == 'success') {
        completer.complete();
      } else {
        completer.completeError(rawResponse);
      }
    }).catchError((error) => completer.completeError(error));
    return completer.future;
  }
}
