import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CheckListItem extends StatelessWidget {
  final String description;
  final String budget;
  final String location;
  final String date;
  final bool checkValue;
  const CheckListItem(
      {Key? key,
      required this.description,
      required this.budget,
      required this.location,
      required this.date,
      required this.checkValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: Padding(
              padding: EdgeInsets.fromLTRB(10, 5, 10, 0),
              child: customCheckBox(checkValue),
            ),
            flex: 2,
          ),
          Flexible(
            child: Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 10, 5),
              child: buildContainerOfAddEvent(),
            ),
            flex: 10,
          )
        ],
      ),
    );
  }

  Container buildContainerOfAddEvent() {
    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
            height: 45,
            decoration: BoxDecoration(
              color: Color.fromRGBO(255, 255, 255, 1),
              border: Border.all(
                  color: Color.fromRGBO(249, 172, 93, 1), width: 1.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Flexible(
                  fit: FlexFit.tight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        child: Text(
                          "Add Item",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Color.fromRGBO(157, 157, 157, 1)),
                        ),
                      )
                    ],
                  ),
                ),
                Flexible(
                    fit: FlexFit.tight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: RotationTransition(
                            turns: AlwaysStoppedAnimation(90 / 360),
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child: Image.asset(
                                "assets/images/right-arrow.png",
                                height: 15,
                              ),
                            ),
                          ),
                        )
                      ],
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }

  Container buildContainerOfDescription() {
    return Container(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
        height: 82,
        decoration: BoxDecoration(
          color: Color.fromRGBO(255, 255, 255, 1),
          border:
              Border.all(color: Color.fromRGBO(249, 172, 93, 1), width: 1.0),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 0),
          child: Row(
            children: [
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(15, 12, 0, 12),
                        child: Text(
                          description,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Color.fromRGBO(157, 157, 157, 1)),
                        ),
                      ),
                      flex: 1,
                    ),
                    Flexible(
                      child: Wrap(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: Text(
                              "\$" + budget,
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Color.fromRGBO(157, 157, 157, 1)),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 15, 0),
                            child: Text(
                              location,
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Color.fromRGBO(157, 157, 157, 1)),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 15, 0),
                            child: Text(
                              date,
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Color.fromRGBO(157, 157, 157, 1)),
                            ),
                          ),
                        ],
                      ),
                      flex: 1,
                    )
                  ],
                ),
                flex: 5,
                fit: FlexFit.tight,
              ),
              Flexible(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Image.asset(
                    "assets/images/right-arrow.png",
                    // height: 15,
                  ),
                ),
                flex: 1,
                fit: FlexFit.tight,
              ),
            ],
          ),
        ));
  }

  Container customCheckBox(bool value) {
    return Container(
        decoration: BoxDecoration(
          color: Color.fromRGBO(255, 255, 255, 1),
          border:
              Border.all(color: Color.fromRGBO(249, 172, 93, 1), width: 1.0),
        ),
        width: 35,
        height: 35,
        child: Visibility(
          visible: value,
          child: Container(
            padding: EdgeInsets.all(10),
            child: Image.asset("assets/images/check-mark.png"),
          ),
        ));
  }
}
