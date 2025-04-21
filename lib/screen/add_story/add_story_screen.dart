import 'package:dicoding_flutter/providers/file_picker_provider.dart';
import 'package:dicoding_flutter/providers/story_provider.dart';
import 'package:dicoding_flutter/screen/add_story/add_story_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/location_picker_provider.dart';

class AddStoryScreen extends StatelessWidget {
  static const routePath = '/add-story';

  const AddStoryScreen({
    super.key,
    required this.onStoryAdded,
    required this.onPickLocation,
  });

  final Function() onStoryAdded;
  final Function() onPickLocation;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => StoryProvider()),
        ChangeNotifierProvider(create: (context) => LocationPickerProvider()),
        ChangeNotifierProvider(create: (context) => FilePickerProvider()),
      ],
      child: AddStoryPage(
        onStoryAdded: onStoryAdded,
        onPickLocation: onPickLocation,
      ),
    );
  }
}
