import 'package:flutter/material.dart';
import 'constants.dart';
import 'reusable_card.dart';

class ResultsPage extends StatelessWidget {
  final String _bmi;
  final String _status;
  final String _analysis;

  ResultsPage(this._bmi, this._status, this._analysis);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Result'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget> [
          Padding(
            padding: const EdgeInsets.only(top: 10.0
            ),
            child: Text(
              'Your Result',
              textAlign: TextAlign.center,
              style: kLabelTitleTextStyle.copyWith(
                fontSize: 30.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Expanded(
            child: ReusableCard(
              kCardBackgroundColor,
              Column(
                children: <Widget> [
                  Expanded(
                    flex: 1,
                    child: Container(
                      child: Center(
                        child: Text(
                          _status.toUpperCase(),
                          style: kLabelTextStyle.copyWith(
                            color: Colors.green.shade300,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Center(
                      child: Text(
                        _bmi,
                        style: kNumberTextStyle,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      child: Center(
                        child: Text(
                          _analysis,
                          style: kBodyTextStyle,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 10.0),
                  child: Text(
                    'RECALCULATE',
                    style: kLabelTitleTextStyle,
                  ),
                ),
              ),
              color: kCardBottomColor,
              width: double.infinity,
              height: kBottomContainerHeight,
            ),
          ),
        ]
      ),
    );
  }
}
