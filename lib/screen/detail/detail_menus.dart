import 'package:dicoding_flutter/common/theme.dart';
import 'package:dicoding_flutter/components/chip_list.dart';
import 'package:dicoding_flutter/data/model/restaurant.dart';
import 'package:flutter/material.dart';

class DetailMenus extends StatelessWidget {
  const DetailMenus({super.key, required this.foods, required this.drinks});

  final List<Category> foods;
  final List<Category> drinks;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ChipList(title: 'Foods', list: foods.map((m) => m.name).toList()),
          const SizedBox(height: defaultPadding * 2),
          ChipList(title: 'Drinks', list: drinks.map((m) => m.name).toList()),
        ],
      ),
    );
  }
}
