import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../color_helper.dart';

class PurpleIconButton extends StatelessWidget {
  PurpleIconButton({
    Key? key,
    required this.text,
    required this.buttonIcon,
    required this.onTap,
  }) : super(key: key);

  final String text;
  final String buttonIcon;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: ColorHelper.primaryGradientTop,
        borderRadius: BorderRadius.circular(4),
      ),
      child: InkWell(
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(right: 8),
              child: Text(
                text,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            SvgPicture.asset(
              buttonIcon,
              color: Colors.white,
            ),
          ],
        ),
        onTap: onTap,
      ),
    );
  }
}
