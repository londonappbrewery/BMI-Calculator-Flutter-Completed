import 'package:flutter/material.dart';
import '../constants.dart';

class BottomButton extends StatelessWidget {
  BottomButton({required this.onTap, @required this.buttonTitle});

  final VoidCallback onTap;
  final String? buttonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            buttonTitle.toString(),
            style: kLargeButtonTextStyle,
          ),
        ),
        color: kBottomContainerClr,
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        padding: EdgeInsets.only(bottom: 20.0),
        height: kBottomContainerHeight,
      ),
    );
  }
}
