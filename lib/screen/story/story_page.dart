import 'package:cached_network_image/cached_network_image.dart';
import 'package:dicoding_flutter/common/constants.dart';
import 'package:dicoding_flutter/common/theme.dart';
import 'package:dicoding_flutter/components/error_view.dart';
import 'package:dicoding_flutter/components/loading.dart';
import 'package:dicoding_flutter/providers/state/data_state.dart';
import 'package:dicoding_flutter/providers/story_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class StoryPage extends StatefulWidget {
  const StoryPage({super.key, required this.id, required this.onMapView});

  final String id;
  final Function(LatLng latLng) onMapView;

  @override
  State<StoryPage> createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<StoryProvider>().getStory(widget.id);
    });
  }

  placeHolder() {
    return Image.asset(
      assetsRaw('placeholder.png'),
      width: double.infinity,
      fit: BoxFit.fitWidth,
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(),
      body: Consumer<StoryProvider>(
        builder: (context, state, child) {
          final story = state.story;
          final placemark = state.placemark;
          if (story != null) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  CachedNetworkImage(
                    imageUrl: story.photoUrl,
                    placeholder: (context, url) => const Loading(),
                    errorWidget: (context, s, o) => placeHolder(),
                    width: size.width,
                    fit: BoxFit.fitWidth,
                  ),
                  Container(
                    width: size.width,
                    padding: const EdgeInsets.all(defaultPadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (placemark != null)
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: colorScheme.onPrimary,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            padding: const EdgeInsets.all(defaultPadding / 2),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        placemark.street!,
                                        style: textTheme.labelLarge,
                                      ),
                                      Text(
                                        '${placemark.subLocality}, ${placemark.locality}, ${placemark.postalCode}, ${placemark.country}',
                                        style: textTheme.labelMedium,
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(width: defaultPadding / 2),
                                IconButton.outlined(
                                  onPressed: () {
                                    widget.onMapView(
                                        LatLng(story.lat!, story.lon!));
                                  },
                                  icon: const Icon(Icons.map_outlined),
                                )
                              ],
                            ),
                          ),
                        const SizedBox(height: defaultPadding),
                        Text(
                          story.name,
                          style: textTheme.titleMedium,
                        ),
                        Text(
                          story.formattedDate(),
                          style: textTheme.labelMedium,
                        ),
                        const SizedBox(height: defaultPadding),
                        Text(story.description),
                        const SizedBox(height: 100)
                      ],
                    ),
                  )
                ],
              ),
            );
          } else if (state.state == DataState.isLoading) {
            return const Loading();
          } else if (state.state == DataState.error) {
            return ErrorView(error: state.error);
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
