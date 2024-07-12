import 'package:dicoding_flutter/common/theme.dart';
import 'package:dicoding_flutter/components/chip_list.dart';
import 'package:dicoding_flutter/data/model/restaurant.dart';
import 'package:flutter/material.dart';

class DetailCategories extends StatelessWidget {
  const DetailCategories({super.key, required this.categories});

  final List<Category> categories;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(defaultPadding),
      child: ChipList(
          title: 'Categories', list: categories.map((m) => m.name).toList()),
    );
  }
}
