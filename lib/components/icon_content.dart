import 'package:flutter/material.dart';

import '../constants.dart';


class IconContent extends StatelessWidget {

  IconContent({this.icn, this.label});

  final IconData? icn;
  final String? label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icn ?? Icons.error,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(label ?? '', style: kLabelTextStyle,)
      ],
    );
  }
}
