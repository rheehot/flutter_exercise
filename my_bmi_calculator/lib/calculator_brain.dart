import 'dart:math';

class CalculatorBrain {
  final int _height;
  final int _weight;
  double _bmi;

  CalculatorBrain(this._height, this._weight);

  String calculateBMI() {
    _bmi = _weight / pow(_height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getStatus() {
    if (_bmi >= 25.0) {
      return 'OverWeight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'UnderWeight';
    }
  }

  String getAnalysis() {
    if (_bmi >= 25.0) {
      return 'You have a higher than normal body weight!';
    } else if (_bmi > 18.5) {
      return 'You have a normal body weight. Good job!';
    } else {
      return 'You have a lower than normal body weight!';
    }
  }
}
