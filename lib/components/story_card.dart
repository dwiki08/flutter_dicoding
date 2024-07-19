import 'package:cached_network_image/cached_network_image.dart';
import 'package:dicoding_flutter/common/constants.dart';
import 'package:dicoding_flutter/common/theme.dart';
import 'package:dicoding_flutter/components/loading.dart';
import 'package:dicoding_flutter/data/model/story.dart';
import 'package:flutter/material.dart';

class StoryCard extends StatelessWidget {
  const StoryCard({super.key, required this.story, required this.onCardTap});

  final Story story;
  final Function(String storyId) onCardTap;

  placeHolder() {
    return Image.asset(
      assetsRaw('placeholder.png'),
      width: double.infinity,
      fit: BoxFit.fitWidth,
      height: 200,
    );
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme
        .of(context)
        .textTheme;
    return Container(
      padding: const EdgeInsets.all(defaultPadding / 2),
      width: double.infinity,
      child: Card(
          clipBehavior: Clip.hardEdge,
          child: InkWell(
            onTap: () => onCardTap(story.id),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CachedNetworkImage(
                  cacheKey: story.id,
                  imageUrl: story.photoUrl,
                  placeholder: (context, url) => const Loading(),
                  errorWidget: (context, s, o) => placeHolder(),
                  width: double.infinity,
                  fit: BoxFit.fitWidth,
                  height: 200,
                ),
                Padding(
                  padding: const EdgeInsets.all(defaultPadding / 2),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        story.name,
                        style: textTheme.bodyMedium
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        story.formattedDate(format: 'hh.mm - d MMMM yyyy'),
                        style: textTheme.labelMedium,
                      ),
                      if (story.place != null) Text(
                        '${story.place?.subLocality}, ${story.place
                            ?.locality}, ${story.place?.postalCode}, ${story
                            .place?.country}',
                        style: textTheme.labelMedium,),
                      const SizedBox(height: defaultPadding / 2),
                      Text(
                        story.description,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}
