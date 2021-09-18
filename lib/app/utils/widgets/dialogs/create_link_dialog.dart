import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jsbank_remittance/app/utils/color_helper.dart';

class CreateLinkDialog extends StatelessWidget {
  CreateLinkDialog({
    Key? key,
    required this.onTapShare,
    required this.onTapCopy,
    required this.linkText,
  }) : super(key: key);

  final void Function()? onTapShare;
  final void Function()? onTapCopy;
  final String linkText;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        decoration: BoxDecoration(
          gradient: ColorHelper.primaryAppGradient,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.all(20),
        child: Wrap(
          children: [
            Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 24,
                  child: Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        alignment: Alignment.center,
                        child: Text(
                          "Create Link",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Icon(
                            Icons.close,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(color: Colors.white),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(top: 10, bottom: 10),
                  padding:
                      EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    linkText,
                    style: TextStyle(
                      color: ColorHelper.greyText,
                      fontSize: 16,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                          left: 8, right: 12, top: 10, bottom: 10),
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.white,
                      ),
                      child: InkWell(
                        child: Icon(
                          Icons.share_outlined,
                          color: ColorHelper.primaryGradientBottom,
                        ),
                        onTap: onTapShare,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.white,
                      ),
                      child: InkWell(
                        child: Icon(
                          Icons.link,
                          color: ColorHelper.primaryGradientBottom,
                        ),
                        onTap: onTapCopy,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
