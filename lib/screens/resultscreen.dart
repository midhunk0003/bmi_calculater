import 'package:bmi_calculater/screens/constantfile.dart';
import 'package:bmi_calculater/screens/homescreen.dart';
import 'package:bmi_calculater/screens/repetedsameContainer.dart';
import 'package:flutter/material.dart';

class Resultscreen extends StatelessWidget {
  final String? bmiResult;
  final String resultText;
  final String InterPretation;
  Resultscreen(
      {required this.bmiResult,
      required this.resultText,
      required this.InterPretation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RESULT'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: Center(
                child: Text(
                  "YOUR RESULT",
                  style: kTitleStyle,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 7,
            child: RepeatedSameContainer(
              colors: Color(0xFF1D1E33),
              cardWidget: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    resultText.toUpperCase(),
                    style: kResultStyle,
                  ),
                  Text(
                    bmiResult!,
                    style: kNumbertStyle,
                  ),
                  Text(
                    InterPretation,
                    style: kIndicationStyle,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                print('re calculate');
                Navigator.pop(context);
              },
              child: Container(
                color: Color.fromARGB(255, 6, 117, 71),
                margin: EdgeInsets.only(top: 10.0),
                width: double.infinity,
                height: 50.0,
                child: Center(
                  child: Text('RE CALCULATE'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
