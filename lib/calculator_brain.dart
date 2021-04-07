import 'dart:math';
import 'package:bmi_calculator/screens/input_page.dart';
import 'package:flutter/cupertino.dart';

class CalculatorBrain {
  CalculatorBrain({@required this.weight,@required this.height,@required this.age,@required this.gender});
  final int height;
  final int weight;
  final int age;
  final Gender gender;
  double _bmi;
  //start values for 25-34 male
  double _overweight = 25.0;
  double _underweight = 20;

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    //Gender Check
    if (gender == Gender.female) {
      _overweight--;
      _underweight--;
    }

    //Age Check
    if (age <= 24) {
      _overweight--;
      _underweight--;
      // 25 -34 is the normal Rate
    } else if (age >= 35 && age <= 44) {
      _overweight++;
      _underweight++;
    } else if (age >= 45 && age <= 54) {
      _overweight = _overweight + 2;
      _underweight = _underweight + 2;
    } else if (age >= 55 && age <= 64) {
      _overweight = _overweight + 3;
      _underweight = _underweight + 3;
    } else if (age > 64) {
      _overweight = _overweight + 4;
      _underweight = _underweight + 4;
    }

    if (_bmi >= _overweight) {
      return 'Overweight';
    } else if (_bmi > _underweight) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation() {
    if (_bmi >= _overweight) {
      return 'You have a higher than normal body weight. Try to exercise more.';
    } else if (_bmi > _underweight) {
      return 'You have a normal body weight. Good job!';
    } else {
      return 'You have a lower than normal body weight. You can eat a bit more.';
    }
  }
}
