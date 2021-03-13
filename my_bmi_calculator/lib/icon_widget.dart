import 'package:flutter/material.dart';
import 'constants.dart';

class IconWidget extends StatelessWidget {

  final IconData _icon;
  final String _text;

  IconWidget(this._icon, this._text);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          _icon,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          _text,
          style: kLabelTextStyle,
        ),
      ],
    );
  }
}
