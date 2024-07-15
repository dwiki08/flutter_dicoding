import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  @JsonKey(name: "error")
  bool? error;
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "loginResult")
  LoginResultResponse? loginResult;

  LoginResponse({this.error, this.message, this.loginResult});

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}

@JsonSerializable()
class LoginResultResponse {
  @JsonKey(name: "userId")
  String? userId;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "token")
  String? token;

  LoginResultResponse(this.userId, this.name, this.token);

  factory LoginResultResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResultResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResultResponseToJson(this);
}
