import 'dart:ui';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

part 'story.freezed.dart';

@freezed
class Story with _$Story {
  const factory Story({
    required String id,
    required String name,
    required String description,
    required String photoUrl,
    required DateTime createdAt,
    double? lat,
    double? lon,
  }) = _Story;

  const Story._();

  String formattedDate({String? format = 'hh.mm d MMMM yyyy', Locale? locale}) {
    final defaultLocale = PlatformDispatcher.instance.locale;
    return DateFormat(
            format, locale?.languageCode ?? defaultLocale.languageCode)
        .format(createdAt);
  }
}
