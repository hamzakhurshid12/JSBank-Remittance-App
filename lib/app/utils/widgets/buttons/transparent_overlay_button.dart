import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jsbank_remittance/app/utils/color_helper.dart';

class TransparentOverlayButton extends StatelessWidget {
  TransparentOverlayButton({
    Key? key,
    required this.buttonText,
    required this.onTap,
    required this.icon,
  }) : super(key: key);

  final String buttonText;
  final IconData icon;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor: Colors.white,
          customBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 28),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                  color: ColorHelper.noFocusTextFieldOutlineDullWhite),
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Text(
                    buttonText,
                    style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                        color: ColorHelper.textDullWhiteHint,
                        fontSize: 13,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(),
                ),
                Icon(
                  icon,
                  color: ColorHelper.noFocusTextFieldOutlineDullWhite,
                ),
              ],
            ),
          ),
          onTap: onTap,
        ),
      ),
    );
  }
}
