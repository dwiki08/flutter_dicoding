import 'package:dicoding_flutter/providers/story_provider.dart';
import 'package:dicoding_flutter/screen/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
    required this.onLogout,
    required this.onDetailStory,
    required this.onAddStory,
    required this.onDialogLogout,
  });

  final Function(bool isLoggedIn) onLogout;
  final Function(String storyId) onDetailStory;
  final Function() onAddStory;
  final Function() onDialogLogout;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => StoryProvider(),
      child: HomePage(
        onLogout: onLogout,
        onDetailStory: onDetailStory,
        onAddStory: onAddStory,
        onDialogLogout: onDialogLogout,
      ),
    );
  }
}
