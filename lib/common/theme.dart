import 'package:flutter/material.dart';

const double defaultPadding = 16.0;

const defaultCircularRadius = Radius.circular(12);

ColorScheme colorScheme(BuildContext context) {
  return ColorScheme.fromSeed(seedColor: const Color(0xff42515a)).copyWith(
    primary: const Color(0xff42515a),
    onPrimary: const Color(0xff24323b),
    secondary: const Color(0x0f83939b),
  );
}

const appBarColor = Color(0xECBBE5FF);

const appBarShape = RoundedRectangleBorder(
  borderRadius: BorderRadius.only(
      bottomLeft: defaultCircularRadius, bottomRight: defaultCircularRadius),
);

InputDecoration textFieldDecoration(
        BuildContext context, String label, String hint) =>
    InputDecoration(
      labelText: label,
      hintText: hint,
      hintStyle: Theme.of(context).textTheme.labelMedium,
      alignLabelWithHint: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
