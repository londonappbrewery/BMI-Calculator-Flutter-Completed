import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:flutter/widgets.dart';

class BottomButton extends StatelessWidget {
  BottomButton({@required this.onTap, @required this.buttonTitle});

  final Function onTap;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: onTap,
      padding: EdgeInsets.symmetric(vertical: 14, horizontal: 26),
      color: kBottomContainerColour,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
      child: AutoSizeText(
        buttonTitle,
        style: kLargeButtonTextStyle,
      ),
    );
  }
}
