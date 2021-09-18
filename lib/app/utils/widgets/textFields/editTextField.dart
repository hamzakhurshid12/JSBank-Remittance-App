import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../color_helper.dart';

class EditTextField extends StatelessWidget {
  const EditTextField({
    Key? key,
    this.hintText = "hintText not set",
    this.textEditingController,

  }) : super(key: key);

  final String hintText;
  final TextEditingController? textEditingController;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
      child: TextFormField(
        controller: textEditingController?? null,
        decoration: InputDecoration(

          contentPadding: EdgeInsets.only(left: 20, right: 20),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          hintText: hintText,
          hintStyle: TextStyle(color: ColorHelper.greyText),
          fillColor: ColorHelper.dropShadowColor,
          filled: true,

        ),
      ),
    );
  }
}
