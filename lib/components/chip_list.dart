import 'package:flutter/material.dart';

class ChipList extends StatelessWidget {
  const ChipList({super.key, required this.title, required this.list});

  final String title;
  final List<String> list;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    List<Chip> chips = [];
    for (final text in list) {
      chips.add(
        Chip(
          label: Text(
            text,
            style: const TextStyle(fontSize: 12),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
        Wrap(
          alignment: WrapAlignment.center,
          runSpacing: 8,
          spacing: 8,
          children: chips,
        ),
      ],
    );
  }
}
