import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../color_helper.dart';

class WhiteOutlineTextField extends StatelessWidget {
  const WhiteOutlineTextField({
    Key? key,
    required this.hintText,
    required this.width,
    this.height = 55.0,
    this.isPassword = false,
    this.showPassword = false,
    this.controller,
    this.onPasswordClick,
    this.focus,
    this.focusNode,
    this.maxLines = 1,
  }) : super(key: key);

  final String hintText;
  final int maxLines;
  final double width;
  final double height;
  final bool isPassword;
  final bool showPassword;
  final TextEditingController? controller;
  final VoidCallback? onPasswordClick;
  final Function? focus;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: TextFormField(
        controller: controller ?? null,
        onFieldSubmitted: (value) {
          focus!();
        },
        focusNode: focusNode,
        maxLines: maxLines,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 28, vertical: 18),
          focusedBorder:
              OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10.0)), borderSide: BorderSide(color: ColorHelper.whiteColor)),
          errorBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10.0)), borderSide: BorderSide(color: Colors.red)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)), borderSide: BorderSide(color: ColorHelper.noFocusTextFieldOutlineDullWhite)),
          hintStyle: TextStyle(color: ColorHelper.textDullWhiteHint, fontFamily: "Roboto", fontSize: 13),
          labelText: hintText,
          labelStyle: TextStyle(color: ColorHelper.textDullWhiteHint, fontFamily: "Roboto", fontSize: 13),
          suffixIcon: isPassword
              ? GestureDetector(child:Image.asset("assets/images/ic_eye_password.png"),
            onTap: onPasswordClick,
          )
              : null,
        ),
        style: TextStyle(color: ColorHelper.whiteColor, fontFamily: "Roboto", fontSize: 13),
        obscureText: isPassword && !showPassword,
      ),
    );
  }
}