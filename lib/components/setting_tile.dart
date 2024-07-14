import 'package:dicoding_flutter/common/theme.dart';
import 'package:flutter/material.dart';

class SettingTile extends StatelessWidget {
  const SettingTile({
    super.key,
    required this.title,
    required this.description,
    this.isChecked,
    this.onChecked,
  });

  final String title;
  final String description;
  final bool? isChecked;
  final Function(bool isChecked)? onChecked;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: textTheme.titleMedium,
              ),
              Text(
                description,
                style: textTheme.labelSmall,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              )
            ],
          ),
        ),
        const SizedBox(width: defaultPadding),
        Switch.adaptive(
            value: isChecked == true,
            onChanged: (isChecked) {
              if (onChecked != null) onChecked!(isChecked);
            })
      ],
    );
  }
}
