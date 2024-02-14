import 'dart:math';

class CalculateBmi {
  final int? height;
  final int? weight;
  double? bmiresult;
  CalculateBmi({this.height, this.weight, this.bmiresult});

  String? Calculatedbmi() {
    bmiresult = weight! / pow(height! / 100, 2);
    return bmiresult?.toStringAsFixed(2);
  }

  String getResult() {
    if (bmiresult! < 18.5) {
      return 'UNDER WEIGHT';
    } else if (bmiresult! >= 18.5 && bmiresult! <= 24.9) {
      return 'NORMAL';
    } else if (bmiresult! >= 24.9 && bmiresult! <= 29.9) {
      return 'OVER WEIGHT';
    } else if (bmiresult! > 30) {
      return 'OBESE';
    }
    return 'EMPTY';
  }

  String getInterpretation() {
    if (bmiresult! < 18.5) {
      return 'Underweight\n\nPeople with a BMI less than 18.5 are considered underweight. It may be beneficial to consult with a healthcare professional to assess your nutritional status and overall health.';
    } else if (bmiresult! >= 18.5 && bmiresult! <= 24.9) {
      return 'Normal weight\n\nCongratulations! Your BMI falls within the normal weight range. This suggests that your weight is in a healthy range for your height. Maintain a balanced diet and regular exercise for overall well-being.';
    } else if (bmiresult! >= 24.9 && bmiresult! <= 29.9) {
      return 'Overweight\n\nIndividuals with a BMI between 25 and 29.9 are considered overweight. It is advisable to focus on a combination of healthy eating and regular physical activity to achieve and maintain a healthier weight.';
    } else if (bmiresult! > 30) {
      return 'Obese\n\nPeople with a BMI of 30 or higher are classified as obese. Obesity can increase the risk of various health issues. It is strongly recommended to seek guidance from a healthcare professional to develop a personalized plan for weight management.';
    }
    return 'EMPTY';
  }
}
