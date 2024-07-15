import 'package:json_annotation/json_annotation.dart';

import 'story_response.dart';

part 'list_story_response.g.dart';

@JsonSerializable()
class ListStoryResponse {
  @JsonKey(name: "error")
  bool? error;
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "listStory")
  List<StoryResponse>? listStory;

  ListStoryResponse({
    this.error,
    this.message,
    this.listStory,
  });

  factory ListStoryResponse.fromJson(Map<String, dynamic> json) =>
      _$ListStoryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ListStoryResponseToJson(this);
}
