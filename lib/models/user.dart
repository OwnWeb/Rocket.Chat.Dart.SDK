part of models;

@JsonSerializable()
class User {
  User();

  @JsonKey(name: '_id')
  String id;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'username')
  String userName;

  @JsonKey(name: 'status')
  String status;

  @JsonKey(name: 'active')
  bool active;

  @JsonKey(name: 'emails')
  List<UserEmail> emails;

  @JsonKey(name: 'customFields')
  Map<String, dynamic> customFields;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}

@JsonSerializable()
class AuthInfo {
  AuthInfo();

  @JsonKey(name: '_id')
  String id;

  @JsonKey(name: 'token')
  String token;

  @JsonKey(name: 'tokenExpires')
  int tokenExpires;
}

@JsonSerializable()
class UserEmail {
  UserEmail();

  @JsonKey(name: 'address')
  String address;

  @JsonKey(name: 'verified')
  bool verified;

  factory UserEmail.fromJson(Map<String, dynamic> json) =>
      _$UserEmailFromJson(json);

  Map<String, dynamic> toJson() => _$UserEmailToJson(this);
}
