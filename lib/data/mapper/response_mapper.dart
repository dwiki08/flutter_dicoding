import 'package:dicoding_flutter/common/extensions.dart';
import 'package:dicoding_flutter/data/model/story.dart';
import 'package:dicoding_flutter/data/remote/response/story_response.dart';

extension StoryDTO on StoryResponse {
  Story toModel() {
    return Story(
        id: id.orEmpty(),
        name: name.orEmpty(),
        description: description.orEmpty(),
        photoUrl: photoUrl.orEmpty(),
        createdAt: createdAt!);
  }
}
