import 'package:dicoding_flutter/common/constants.dart';
import 'package:dicoding_flutter/providers/setting_provider.dart';
import 'package:dicoding_flutter/utils/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class DropdownFlags extends StatelessWidget {
  const DropdownFlags({super.key});

  @override
  Widget build(BuildContext context) {
    Widget? getFlag(String lang) {
      switch (lang) {
        case 'id':
          return SvgPicture.asset(
            assetsIcons('ic_flag_indonesia.svg'),
            height: 24,
            width: 24,
          );
        case 'en':
          return SvgPicture.asset(
            assetsIcons('ic_flag_usa.svg'),
            height: 24,
            width: 24,
          );
      }
      return null;
    }

    return Consumer<SettingProvider>(builder: (context, state, child) {
      final lang = state.locale.languageCode;
      return DropdownButtonHideUnderline(
        child: DropdownButton(
          icon: getFlag(lang),
          items: AppLocalizations.supportedLocales.map((Locale locale) {
            return DropdownMenuItem(
              value: locale,
              child: Center(
                child: getFlag(locale.languageCode),
              ),
              onTap: () => context.read<SettingProvider>().setLocale(locale),
            );
          }).toList(),
          onChanged: (_) {},
        ),
      );
    });
  }
}
