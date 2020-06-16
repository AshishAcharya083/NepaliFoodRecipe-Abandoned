import 'dart:math';

class CalculatorBrain{

CalculatorBrain({this.height,this.weight});
  int height;
  int weight;

  double _bmi;

  String calculateBMI(){
     _bmi = weight / pow(height/100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResults(){
    if(_bmi >= 25){
      return ' Over Weight';
    }else if(_bmi > 18.5){
        return 'Normal';
    }else {
      return 'Under Weight';
    }

  }
String getInterpretation()
{
  if(_bmi >= 25){
      return ' You have higher than normal body weight. Try to exercise more';
    }else if(_bmi > 18.5){
        return 'You have normal body weight. Good job!';
    }else {
      return 'You have lower than normal body weight. Try to eat more';
    }

}
}