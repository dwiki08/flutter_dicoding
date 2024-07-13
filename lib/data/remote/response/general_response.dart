import 'package:json_annotation/json_annotation.dart';

part 'general_response.g.dart';

@JsonSerializable()
class GeneralResponse {
  @JsonKey(name: "error")
  bool? error;
  @JsonKey(name: "message")
  String? message;

  GeneralResponse({
    this.error,
    this.message,
  });

  factory GeneralResponse.fromJson(Map<String, dynamic> json) =>
      _$GeneralResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GeneralResponseToJson(this);
}
