import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FlatWhiteButton extends StatelessWidget {
  final String text;
  final Color color;
  final void Function()? onTap;
  const FlatWhiteButton({
    Key? key,
    required this.text,
    required this.color,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        if (onTap != null) {
          onTap!();
        }
      },
      child: Text(text, style: TextStyle(color: color)),
    );
  }
}
