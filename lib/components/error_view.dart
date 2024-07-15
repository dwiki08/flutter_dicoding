import 'package:dicoding_flutter/common/constants.dart';
import 'package:dicoding_flutter/common/extensions.dart';
import 'package:dicoding_flutter/common/theme.dart';
import 'package:dicoding_flutter/data/model/error_result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ErrorView extends StatelessWidget {
  const ErrorView({super.key, this.error});

  final ErrorResult? error;

  @override
  Widget build(BuildContext context) {
    String icon = '';

    switch (error?.code) {
      case 1:
        icon = 'ic_internet.svg';
        break;
      case 404:
        icon = 'ic_question.svg';
        break;
      default:
        icon = 'ic_sad.svg';
        break;
    }

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            assetsIcons(icon),
            height: 100,
            width: 100,
          ),
          const SizedBox(
            height: defaultPadding,
          ),
          Padding(
            padding: const EdgeInsets.all(defaultPadding),
            child: Text(error?.code?.httpCodeText() ?? ''),
          )
        ],
      ),
    );
  }
}
