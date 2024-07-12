import 'package:dicoding_flutter/common/constants.dart';
import 'package:dicoding_flutter/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FillerView extends StatelessWidget {
  const FillerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            assetsIcons('ic_chef.svg'),
            height: 100,
            width: 100,
          ),
          const SizedBox(height: defaultPadding),
          Text(appName, style: Theme.of(context).textTheme.titleLarge)
        ],
      ),
    );
  }
}
