import 'package:dicoding_flutter/common/extensions.dart';
import 'package:dicoding_flutter/common/navigation.dart';
import 'package:dicoding_flutter/common/theme.dart';
import 'package:dicoding_flutter/data/model/error_result.dart';
import 'package:dicoding_flutter/providers/review_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WriteReviewPage extends StatefulWidget {
  const WriteReviewPage({super.key, required this.restaurantId});

  final String restaurantId;

  @override
  State<WriteReviewPage> createState() => _WriteReviewPageState();
}

class _WriteReviewPageState extends State<WriteReviewPage> {
  ValueNotifier<bool> isAddSuccess = ValueNotifier<bool>(false);
  ValueNotifier<ErrorResult?> errorResult =
      ValueNotifier<ErrorResult?>(const ErrorResult());

  final _nameTextController = TextEditingController();
  final _reviewTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      isAddSuccess.addListener(() {
        if (isAddSuccess.value) Navigation.back(result: true);
      });
      errorResult.addListener(() {
        if (errorResult.value != null) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(errorResult.value?.code?.httpCodeText() ?? ''),
            duration: const Duration(seconds: 2),
          ));
        }
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    isAddSuccess.dispose();
    errorResult.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<ReviewProvider>().state;

    isAddSuccess.value = state.addSuccess;
    errorResult.value = state.error;

    sendReview() {
      context.read<ReviewProvider>().addReview(widget.restaurantId,
          _nameTextController.text, _reviewTextController.text);
    }

    return Scaffold(
      floatingActionButton: Container(
        padding: const EdgeInsets.only(
            bottom: defaultPadding, right: defaultPadding),
        child: FloatingActionButton(
          onPressed: () {
            if (_nameTextController.text.isNotEmpty &&
                _reviewTextController.text.isNotEmpty) sendReview();
          },
          tooltip: 'Send review',
          child: state.isLoading
              ? const CircularProgressIndicator()
              : const Icon(Icons.send),
        ),
      ),
      appBar: AppBar(
        title: const Text('Write a review'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            TextField(
              controller: _nameTextController,
              enabled: !state.isLoading,
              decoration: textFieldDecoration(
                context,
                'Name',
                'Your name',
              ).copyWith(
                  errorText: _nameTextController.text.isEmpty
                      ? 'Please fill this field'
                      : null),
              onChanged: (text) => setState(() {
                _nameTextController.text = text;
              }),
            ),
            const SizedBox(height: defaultPadding * 2),
            TextField(
              controller: _reviewTextController,
              enabled: !state.isLoading,
              maxLines: 5,
              decoration: textFieldDecoration(
                context,
                'Review',
                'Write your story and impression',
              ).copyWith(
                  errorText: _reviewTextController.text.isEmpty
                      ? 'Please fill this field'
                      : null),
              onChanged: (text) => setState(() {
                _reviewTextController.text = text;
              }),
            ),
          ],
        ),
      ),
    );
  }
}
