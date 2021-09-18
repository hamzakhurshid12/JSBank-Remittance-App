import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jsbank_remittance/app/utils/color_helper.dart';


class ScreenTitle extends StatelessWidget {
  ScreenTitle({
    Key? key,
    required this.title,
    this.bottom = 20,
  }) : super(key: key);

  final String title;
  final double bottom;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: bottom),
      child: Text(
        title,
        style: GoogleFonts.roboto(
          textStyle: TextStyle(
            fontSize: 20,
            color: ColorHelper.primaryGradientTop,
          ),
        ),
      ),
    );
  }
}
