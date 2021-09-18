import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jsbank_remittance/app/utils/color_helper.dart';
import 'package:get/get.dart';

class FlatButtonWhite extends StatelessWidget {
  const FlatButtonWhite({
    Key? key,
    required this.width,
    required this.onPressed,
    this.text = "",
    this.isEnabled= true,
  }) : super(key: key);

  final double width;
  final VoidCallback onPressed;
  final String text;
  final bool isEnabled;

  @override
  Widget build(BuildContext context) {

    return Container(
      width: width,
      height: 55.0,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: isEnabled? Color(0xFFA30F68) : ColorHelper.buttonBackgroundDefault,
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      child: TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.all(18.0),
          primary: Colors.white,
          textStyle: TextStyle(
              color: isEnabled ? ColorHelper.whiteColor : Colors.grey.withOpacity(0.5), fontSize: 17, fontWeight: FontWeight.bold, fontFamily: "Roboto"),
        ),
        onPressed: isEnabled? onPressed : (){/*Do nothing*/},
        child: Text(text),
      ),
    );
  }
}
