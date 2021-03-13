import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Color _color;
  final Widget _childWidget;
  final Function _onPress;

  ReusableCard(this._color, [ this._childWidget, this._onPress ]);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onPress,
      child: Container(
        child: _childWidget,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: _color,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
