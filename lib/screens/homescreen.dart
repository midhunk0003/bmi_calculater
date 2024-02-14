import 'package:bmi_calculater/screens/calculatebmi.dart';
import 'package:bmi_calculater/screens/constantfile.dart';
import 'package:bmi_calculater/screens/repetedsameContainer.dart';
import 'package:bmi_calculater/screens/RepeatTextandIcon.dart';
import 'package:bmi_calculater/screens/resultscreen.dart';
import 'package:bmi_calculater/screens/roundedIcon.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:lottie/lottie.dart';

const activeColor = Color(0xFF1D1E33);
const deactiveColor = Color(0xFF11328);

enum Gender {
  male,
  female,
}

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  Gender? selectGender;
  int sliderValueHeight = 180;
  int sliderValueWeight = 60;
  int sliderValueAge = 26;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('BMI  CALCULATER'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            //first row main and femail
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          print(selectGender);
                          selectGender = Gender.male;
                        });
                      },
                      child: RepeatedSameContainer(
                        colors: selectGender == Gender.male
                            ? activeColor
                            : deactiveColor,
                        cardWidget: RepeatTextandIcon(
                          iconData: FontAwesomeIcons.male,
                          label: 'MALE',
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(
                          () {
                            selectGender = Gender.female;
                          },
                        );
                      },
                      child: RepeatedSameContainer(
                        colors: selectGender == Gender.female
                            ? activeColor
                            : deactiveColor,
                        cardWidget: RepeatTextandIcon(
                          iconData: FontAwesomeIcons.female,
                          label: 'FEMALE',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // second progress indicator

            Expanded(
              child: Container(
                margin: EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Color(0xFF1D1E33),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Height',
                      style: kLabelStyle,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      '${sliderValueHeight.toString()} cm',
                      style: TextStyle(fontSize: 28),
                    ),
                    SliderTheme(
                      data: SliderThemeData(
                        activeTrackColor: Color.fromARGB(255, 6, 143,
                            79), // Change the color of the active track
                        inactiveTrackColor: Color.fromARGB(75, 127, 255,
                            7), // Change the color of the inactive track
                        thumbColor: const Color.fromARGB(255, 151, 149,
                            148), // Change the color of the thumb
                      ),
                      child: Slider(
                        value: sliderValueHeight.toDouble(),
                        min: 0.0,
                        max: 250.0,
                        onChanged: (double value) {
                          setState(() {
                            sliderValueHeight = value.round();
                          });
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),

            // third calculate and add value postion

            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: RepeatedSameContainer(
                      colors: Color(0xFF1D1E33),
                      cardWidget: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'WEIGHT',
                            style: kLabelStyle,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text('$sliderValueWeight',
                              style: TextStyle(fontSize: 40)),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIcon(
                                iconData: FontAwesomeIcons.minus,
                                onPress: () {
                                  setState(() {
                                    sliderValueWeight--;
                                  });
                                },
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              RoundIcon(
                                iconData: FontAwesomeIcons.plus,
                                onPress: () {
                                  setState(() {
                                    sliderValueWeight++;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: RepeatedSameContainer(
                      colors: Color(0xFF1D1E33),
                      cardWidget: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'AGE',
                            style: kLabelStyle,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text('$sliderValueAge',
                              style: TextStyle(fontSize: 40)),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIcon(
                                iconData: FontAwesomeIcons.minus,
                                onPress: () {
                                  setState(() {
                                    sliderValueAge--;
                                  });
                                },
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              RoundIcon(
                                iconData: FontAwesomeIcons.plus,
                                onPress: () {
                                  setState(() {
                                    sliderValueAge++;
                                  });
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // calculate button navigate page

            (selectGender != null)
                ? GestureDetector(
                    onTap: () {
                      // CalculateBmi cal = CalculateBmi(height: sliderHeight,weight: sliderWeight);
                      CalculateBmi calc = CalculateBmi(
                          height: sliderValueHeight, weight: sliderValueWeight);
                      Navigator.push(context, MaterialPageRoute(builder: (ctx) {
                        return Resultscreen(
                          bmiResult: calc.Calculatedbmi(),
                          resultText: calc.getResult(),
                          InterPretation: calc.getInterpretation(),
                        );
                      }));
                    },
                    child: Container(
                      color: Color.fromARGB(255, 6, 117, 71),
                      margin: EdgeInsets.only(top: 10.0),
                      width: double.infinity,
                      height: 50.0,
                      child: Center(
                        child: Text('CALCULATE'),
                      ),
                    ),
                  )
                : GestureDetector(
                    onTap: () {
                      // showSnakebar(context);
                    },
                    child: Container(
                      color: Color.fromARGB(255, 6, 117, 71),
                      margin: EdgeInsets.only(top: 10.0),
                      width: double.infinity,
                      height: 50.0,
                      child: Center(
                        child: Text('CALCULATE'),
                      ),
                    ),
                  )
          ],
        ),
      ),
    );
  }

  // void showSnakebar(BuildContext context) {
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     SnackBar(
  //       duration: Duration(seconds: 4),
  //       backgroundColor: Color.fromARGB(244, 255, 255, 255),
  //       behavior: SnackBarBehavior.floating,
  //       margin: EdgeInsets.all(40),
  //       content: Column(
  //         children: [
  //           // Lottie.asset('asset/animations/delete.json'),
  //           Text(
  //             'PLEASE SELECT GENDER',
  //             style: TextStyle(
  //                 color: Color.fromARGB(255, 128, 23, 23),
  //                 fontWeight: FontWeight.bold,
  //                 fontSize: 16),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
