import 'package:dicoding_flutter/providers/review_provider.dart';
import 'package:dicoding_flutter/screen/write_review/write_review_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WriteReview extends StatelessWidget {
  const WriteReview({super.key, required this.restaurantId});

  static String routeName = '/writeReview';
  final String restaurantId;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ReviewProvider(),
      child: WriteReviewPage(restaurantId: restaurantId),
    );
  }
}
