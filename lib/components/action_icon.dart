import 'package:flutter/material.dart';

Widget actionIconRounded({required Icon icon, required Function() onPressed}) {
  return IconButton(
    icon: ClipOval(
      child: Container(
        color: Colors.white70,
        padding: const EdgeInsets.all(4),
        child: icon,
      ),
    ),
    onPressed: () {
      onPressed();
    },
  );
}
