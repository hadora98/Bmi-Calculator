import 'dart:math';
import 'package:bmi_calculator/Screens/result_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../Componants/reusable_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/Componants/icon_content.dart';
import 'package:bmi_calculator/Componants/RoundIconButton.dart';
import 'package:bmi_calculator/Componants/bottom_container.dart';
import 'package:bmi_calculator/calculater_brain.dart';

bool femaleActive=false;
bool maleActive=false;

enum Gender {
  male,
  female,
}


class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = kInactiveCardColor;
  Color femaleCardColor = kInactiveCardColor;
  int height=160;
  int weight=50;
  double bmi;
  int age=0;
  Gender selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Row(
            children: [
              Expanded(

                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender=Gender.male;
                      });
                    },
                    color: selectedGender==Gender.male?kActiveCardColor:kInactiveCardColor,
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.mars,
                      text: "MALE",
                    ),
                  ),
                ),

              Expanded(

                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender=Gender.female;
                      });
                    },
                    color: selectedGender==Gender.female?kActiveCardColor:kInactiveCardColor,
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.venus,
                      text: "FEMALE",
                    ),
                  ),
                ),

            ],
          )),
          Expanded(
            child: ReusableCard(

              cardChild: Container(

                margin: EdgeInsets.only(top:25.0,bottom: 25.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [

                    Text(

                      "Height",
                    style: kLabelTextStyle,
                    ),
                    Row(
                      textBaseline: TextBaseline.alphabetic,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      children: [

                        Text(height.round().toString(),
                          style: kNumberStyle,
                        ),
                        Text(
                          "cm",
                          style: kLabelTextStyle,

                        ),

                      ],
                    ),
                    SliderTheme(

                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      overlayColor:Color(0x29EB1555),
                      thumbColor: kBottomContainerColor,
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 20),

                    ),

                      child: Slider(


                        inactiveColor: kTextColor,

                        value: height.toDouble(),
                        min: 0,
                        max: 250,
                        onChanged: (value) {
                          setState(() {
                            height = value.toInt();
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              color: kActiveCardColor,
            ),
          ),

          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("WEIGHT",
                          style:kLabelTextStyle ,
                        ),
                        Text(
                          weight.toString(),
                          style:kNumberStyle ,

                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,

                          children: [
                            RoundIconButton(


                              onPressed: (){
                              setState(() {
                                weight++;
                              });
                            },
                                icon:Icon(Icons.add,size: 40,),
                            ),
                            SizedBox(
                              width:10,
                            ),

                            RoundIconButton(

                              onPressed: (){
                                setState(() {

                                    weight>0?weight--:weight=0;
                                });
                              },
                              icon:Icon(Icons.remove,size: 40,),
                            ),
                          ],
                        ),

                      ],
                    ),
                    color: kActiveCardColor,
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("AGE",
                          style:kLabelTextStyle ,
                        ),
                        Text(
                          age.toString(),
                          style:kNumberStyle ,

                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,

                          children: [
                            RoundIconButton(
                              onPressed: (){
                                setState(() {

                                  age++;
                                });
                              },
                              icon: Icon(Icons.add,size: 40,),
                            ),
                            SizedBox(
                              width: 10,
                            ),

                            RoundIconButton(


                              onPressed: (){
                                setState(() {

                                  age>0?age--:age=0;
                                });
                              },
                              icon:Icon(Icons.remove,size: 40,),
                            ),
                          ],
                        ),

                      ],
                    ),
                    color: kActiveCardColor,
                  ),
                ),
              ],
            ),
          ),
          BottomContainer(
            text: 'CALCULATE',
            onTap: () {
              CalculatorBrain calc =
              CalculatorBrain(height: height, weight: weight);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultScreen(
                    bmiResult: calc.calculateBMI(),
                    resultText: calc.getResult(),
                    interpretation: calc.getInterpretation(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}




//Const Vs Final
// final can only be set once (at any time)
// constant get initialized at compile time (u can't assign it something that gets it's val after run time
