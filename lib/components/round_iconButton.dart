import 'package:flutter/material.dart';
import '../constants.dart';



class RoundIconButton extends StatelessWidget {

  RoundIconButton({@required this.icon, @required this.onPressed});

  final IconData? icon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(onPressed: onPressed,
      shape: CircleBorder(),
      child: Icon(icon),
      elevation: 4.0,
      fillColor: Color(0xFF4C4F5E),
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
    );
  }
}
