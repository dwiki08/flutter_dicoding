import 'package:json_annotation/json_annotation.dart';

import 'story_response.dart';

part 'detail_story_response.g.dart';

@JsonSerializable()
class DetailStoryResponse {
  @JsonKey(name: "error")
  bool? error;
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "story")
  StoryResponse? story;

  DetailStoryResponse({
    this.error,
    this.message,
    this.story,
  });

  factory DetailStoryResponse.fromJson(Map<String, dynamic> json) =>
      _$DetailStoryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DetailStoryResponseToJson(this);
}
