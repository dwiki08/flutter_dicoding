import 'package:dicoding_flutter/common/theme.dart';
import 'package:dicoding_flutter/data/model/restaurant.dart';
import 'package:flutter/material.dart';

class DetailReviews extends StatelessWidget {
  const DetailReviews({super.key, required this.reviews});

  final List<CustomerReview> reviews;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;

    Widget listReviews() {
      List<Widget> cards = [];
      for (var r in reviews.reversed) {
        cards.add(const SizedBox(
          width: defaultPadding / 2,
        ));
        cards.add(Card(
          child: Container(
            width: size.width * 0.70,
            height: 140,
            padding: const EdgeInsets.all(defaultPadding / 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(r.name, style: textTheme.titleMedium),
                Text(r.date, style: textTheme.labelSmall),
                const SizedBox(height: defaultPadding / 2),
                Text(r.review, maxLines: 2, overflow: TextOverflow.ellipsis),
              ],
            ),
          ),
        ));
      }
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(children: cards),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: defaultPadding * 2),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
          child: Text(
            'Reviews',
            style: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: defaultPadding / 2),
          child: listReviews(),
        ),
      ],
    );
  }
}
