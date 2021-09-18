import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../color_helper.dart';

class BalanceCard extends StatelessWidget {

  String? title;
  String? amount;
  String? currency;
  String? equivalentAmount;
  String? buttonText;
  Function()? onClickButton;


  BalanceCard(this.title, this.amount, this.currency, this.equivalentAmount,
      this.buttonText, this.onClickButton, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(40)),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.width * 0.4,
            color: ColorHelper.navyBlue1,
            child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      title!,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: ColorHelper.lightNavyBlue),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          amount!,
                          style: GoogleFonts.mulish(
                              //textStyle: Theme.of(context).textTheme.display1,
                              fontSize: 35,
                              fontWeight: FontWeight.w800,
                              color: ColorHelper.yellow2),
                        ),
                        Text(
                          ' '+currency!,
                          style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.w500,
                              color: ColorHelper.yellow.withAlpha(200)),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Eq:',
                          style: GoogleFonts.mulish(
                              //textStyle: Theme.of(context).textTheme.display1,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: ColorHelper.lightNavyBlue),
                        ),
                        Text(
                          equivalentAmount!,
                          style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                        width: 85,
                        padding:
                        EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            border: Border.all(color: Colors.white, width: 1)),
                        child: GestureDetector(
                          onTap: onClickButton,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              const Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 20,
                              ),
                              SizedBox(width: 5),
                              Text(buttonText!,
                                  style: TextStyle(color: Colors.white)),
                            ],
                          )
                        ),
                        )
                  ],
                ),
                Positioned(
                  left: -170,
                  top: -170,
                  child: CircleAvatar(
                    radius: 130,
                    backgroundColor: ColorHelper.lightBlue2,
                  ),
                ),
                Positioned(
                  left: -160,
                  top: -190,
                  child: CircleAvatar(
                    radius: 130,
                    backgroundColor: ColorHelper.lightBlue1,
                  ),
                ),
                Positioned(
                  right: -170,
                  bottom: -170,
                  child: CircleAvatar(
                    radius: 130,
                    backgroundColor: ColorHelper.yellow2,
                  ),
                ),
                Positioned(
                  right: -160,
                  bottom: -190,
                  child: CircleAvatar(
                    radius: 130,
                    backgroundColor: ColorHelper.yellow,
                  ),
                )
              ],
            ),
          )),
    );
  }
}