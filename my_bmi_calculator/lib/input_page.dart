import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const bottomContainerHeight = 80.0;
const cardBackgroundColor = Color(0xFF1D1E33);
const cardBottomColor = Color(0xFFEB1555);

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
              child: Row(
            children: <Widget>[
              Expanded(
                child: ReusableCard(
                  cardBackgroundColor,
                  IconWidget(
                    FontAwesomeIcons.mars,
                    'Male'
                  ),
                ),
              ),
              Expanded(
                child: ReusableCard(cardBackgroundColor),
              ),
            ],
          )),
          Expanded(
            child: ReusableCard(cardBackgroundColor),
          ),
          Expanded(
            child: ReusableCard(cardBackgroundColor),
          ),
          Container(
            color: cardBottomColor,
            margin: EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: bottomContainerHeight,
          ),
        ],
      ),
    );
  }
}

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
          style: TextStyle(
            fontSize: 18.0,
            color: Color(0xFF8D8E98),
          ),
        ),
      ],
    );
  }
}

class ReusableCard extends StatelessWidget {
  final Color _color;
  final Widget _childWidget;

  ReusableCard(this._color, [ this._childWidget ]);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _childWidget,
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: _color,
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}
