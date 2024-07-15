import 'dart:io';

import 'package:dicoding_flutter/common/constants.dart';
import 'package:dicoding_flutter/common/theme.dart';
import 'package:dicoding_flutter/components/custom_snackbar.dart';
import 'package:dicoding_flutter/providers/file_picker_provider.dart';
import 'package:dicoding_flutter/providers/screen_reload_provider.dart';
import 'package:dicoding_flutter/providers/state/data_state.dart';
import 'package:dicoding_flutter/providers/story_provider.dart';
import 'package:dicoding_flutter/utils/common.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class AddStoryPage extends StatefulWidget {
  const AddStoryPage({super.key, required this.onStoryAdded});

  final Function() onStoryAdded;

  @override
  State<AddStoryPage> createState() => _AddStoryPageState();
}

class _AddStoryPageState extends State<AddStoryPage> {
  final _reviewTextController = TextEditingController();
  String? filePath;

  @override
  void dispose() {
    _reviewTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final localize = AppLocalizations.of(context)!;
    final textTheme = Theme.of(context).textTheme;

    onStoryAdded() {
      context.read<ScreenReloadProvider>().reloadHomeScreen();
      widget.onStoryAdded();
    }

    onOpenGallery() async {
      final provider = context.read<FilePickerProvider>();

      final isMacOS = defaultTargetPlatform == TargetPlatform.macOS;
      final isLinux = defaultTargetPlatform == TargetPlatform.linux;
      if (isMacOS || isLinux) return;

      final ImagePicker picker = ImagePicker();
      final XFile? pickedFile = await picker.pickImage(
        source: ImageSource.gallery,
      );
      if (pickedFile != null) {
        filePath = pickedFile.path;
        provider.setFile(pickedFile);
        provider.setFilePath(pickedFile.path);
      }
    }

    onOpenCamera() async {
      final provider = context.read<FilePickerProvider>();

      final isAndroid = defaultTargetPlatform == TargetPlatform.android;
      final isiOS = defaultTargetPlatform == TargetPlatform.iOS;
      final isNotMobile = !(isAndroid || isiOS);
      if (isNotMobile) return;

      final ImagePicker picker = ImagePicker();

      final XFile? pickedFile = await picker.pickImage(
        source: ImageSource.camera,
      );

      if (pickedFile != null) {
        filePath = pickedFile.path;
        provider.setFile(pickedFile);
        provider.setFilePath(pickedFile.path);
      }
    }

    fab() {
      final localize = AppLocalizations.of(context)!;
      return Consumer<StoryProvider>(
        builder: (context, state, child) {
          return FloatingActionButton(
            onPressed: () async {
              if (filePath == null || _reviewTextController.text.isEmpty) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(defaultSnackBar(localize.dialogFillStory));
                return;
              } else {
                if (state.state != DataState.isLoading) {
                  await context
                      .read<StoryProvider>()
                      .addStory(_reviewTextController.text, filePath!);
                  if (state.storyAdded) {
                    onStoryAdded();
                  }
                }
              }
            },
            tooltip: localize.send,
            child: state.state == DataState.isLoading
                ? const CircularProgressIndicator()
                : const Icon(Icons.send),
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(localize.addStory),
      ),
      floatingActionButton: fab(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Consumer<FilePickerProvider>(builder: (context, state, child) {
              if (state.imagePath == null) {
                return Image.asset(
                  assetsRaw('placeholder.png'),
                  height: 200,
                  width: size.width,
                  fit: BoxFit.fitWidth,
                );
              } else {
                return kIsWeb
                    ? Image.network(
                        state.imagePath.toString(),
                        fit: BoxFit.fitWidth,
                      )
                    : Image.file(
                        File(state.imagePath.toString()),
                        fit: BoxFit.contain,
                      );
              }
            }),
            const SizedBox(height: defaultPadding * 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton.icon(
                  onPressed: () => onOpenGallery(),
                  icon: const Icon(Icons.perm_media_outlined),
                  label: Text(localize.gallery),
                ),
                const SizedBox(width: defaultPadding),
                OutlinedButton.icon(
                  onPressed: () => onOpenCamera(),
                  icon: const Icon(Icons.camera_alt_outlined),
                  label: Text(localize.camera),
                ),
              ],
            ),
            const SizedBox(height: defaultPadding * 2),
            Padding(
              padding: const EdgeInsets.all(defaultPadding),
              child: TextField(
                  controller: _reviewTextController,
                  maxLines: 5,
                  keyboardType: TextInputType.multiline,
                  style: textTheme.bodyMedium,
                  decoration: InputDecoration(
                    hintText: localize.writeStoryHint,
                    border: const OutlineInputBorder(),
                  )),
            ),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}
