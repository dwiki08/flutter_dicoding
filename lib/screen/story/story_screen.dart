import 'package:dicoding_flutter/providers/story_provider.dart';
import 'package:dicoding_flutter/screen/story/story_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StoryScreen extends StatelessWidget {
  const StoryScreen({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => StoryProvider(),
      child: StoryPage(
        id: id,
      ),
    );
  }
}
