import 'dart:io';

import 'package:dicoding_flutter/common/constants.dart';
import 'package:dicoding_flutter/common/theme.dart';
import 'package:dicoding_flutter/components/custom_snackbar.dart';
import 'package:dicoding_flutter/providers/file_picker_provider.dart';
import 'package:dicoding_flutter/providers/state/data_state.dart';
import 'package:dicoding_flutter/providers/story_provider.dart';
import 'package:dicoding_flutter/routes/page_manager.dart';
import 'package:dicoding_flutter/utils/common.dart';
import 'package:dicoding_flutter/utils/utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart' as geo;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class AddStoryPage extends StatefulWidget {
  const AddStoryPage(
      {super.key, required this.onStoryAdded, required this.onPickLocation});

  final Function() onStoryAdded;
  final Function() onPickLocation;

  @override
  State<AddStoryPage> createState() => _AddStoryPageState();
}

class _AddStoryPageState extends State<AddStoryPage> {
  final _storyTextController = TextEditingController();
  String? filePath;
  LatLng? location;
  geo.Placemark? placemark;

  @override
  void dispose() {
    _storyTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final localize = AppLocalizations.of(context)!;
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    onStoryAdded() {
      widget.onStoryAdded();
      context
          .read<PageManager>()
          .returnResult((result: PageResult.ok, data: true));
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

    onPickLocation() async {
      widget.onPickLocation();
      final data = await context.read<PageManager>().waitForResult();
      final latLng = data.data as LatLng;
      setState(() async {
        placemark = await getPlacemark(latLng);
        location = latLng;
      });
    }

    fab() {
      final localize = AppLocalizations.of(context)!;
      return Consumer<StoryProvider>(
        builder: (context, state, child) {
          return FloatingActionButton(
            onPressed: () async {
              if (filePath == null || _storyTextController.text.isEmpty) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(defaultSnackBar(localize.dialogFillStory));
                return;
              } else {
                if (state.state != DataState.isLoading) {
                  await context
                      .read<StoryProvider>()
                      .addStory(_storyTextController.text, filePath!, location);
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
            const SizedBox(height: defaultPadding),
            OutlinedButton.icon(
              onPressed: () => onPickLocation(),
              icon: const Icon(Icons.location_pin),
              label: Text(localize.location),
            ),
            const SizedBox(height: defaultPadding * 2),
            if (placemark != null)
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: colorScheme.onPrimary, width: 2),
                    borderRadius: BorderRadius.circular(4)),
                margin: const EdgeInsets.symmetric(horizontal: defaultPadding),
                padding: const EdgeInsets.all(defaultPadding / 2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      placemark!.street!,
                      style: textTheme.labelLarge,
                    ),
                    Text(
                      '${placemark!.subLocality}, ${placemark!.locality}, ${placemark!.postalCode}, ${placemark!.country}',
                      style: textTheme.labelMedium,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                ),
              ),
            Padding(
              padding: const EdgeInsets.all(defaultPadding),
              child: TextField(
                  controller: _storyTextController,
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
