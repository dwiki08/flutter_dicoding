import 'package:json_annotation/json_annotation.dart';

part 'add_review_request.g.dart';

@JsonSerializable()
class AddReviewRequest {
  String id;
  String name;
  String review;

  AddReviewRequest({
    required this.id,
    required this.name,
    required this.review,
  });

  factory AddReviewRequest.fromJson(Map<String, dynamic> json) =>
      _$AddReviewRequestFromJson(json);

  Map<String, dynamic> toJson() => _$AddReviewRequestToJson(this);
}
