import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmicalculator/components/reusable_card.dart';
import '../components/icon_content.dart';
import '../constants.dart';
import 'package:bmicalculator/screens/results_page.dart';
import '../components/bottomButton.dart';
import '../components/round_iconButton.dart';
import 'package:bmicalculator/calculator_brain.dart';

enum Gender {
  Male,
  Female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int height = 180;
  int weight = 55;
  int age = 21;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
                child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.Male;
                      });
                    },
                    clr: selectedGender == Gender.Male
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: IconContent(
                      icn: FontAwesomeIcons.mars,
                      label: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                    child: ReusableCard(
                  onPress: () {
                    setState(() {
                      selectedGender = Gender.Female;
                    });
                  },
                  clr: selectedGender == Gender.Female
                      ? kActiveCardColor
                      : kInactiveCardColor,
                  cardChild: IconContent(
                    icn: FontAwesomeIcons.venus,
                    label: 'FEMALE',
                  ),
                )),
              ],
            )),
            Expanded(
              child: ReusableCard(
                clr: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: <Widget>[
                    Text('Height', style: kLabelTextStyle),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(
                          height.toString(),
                          style: kNumberTextStyle,
                        ),
                        Text(
                          'cm', style: kLabelTextStyle,
                        )
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                        thumbColor: Color(0xFFEB1555),
                        activeTrackColor: Colors.white,
                        overlayColor: Color(0x1fEB1555),
                        inactiveTrackColor: Color(0xFF8D8E98),
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        onChanged: (double newValue){
                          setState(() {
                            height = newValue.round();
                          });
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
                child: Row(
              children: <Widget>[
                Expanded(child: ReusableCard(clr: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Weight', style: kLabelTextStyle),
                    Text(
                      weight.toString(),
                      style: kNumberTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RoundIconButton(icon: FontAwesomeIcons.minus,
                        onPressed: (){
                          setState(() {
                            weight--;
                          });
                        },),
                        SizedBox(
                          width: 10.0,
                        ),
                        RoundIconButton(icon: FontAwesomeIcons.plus,
                          onPressed: (){
                            setState(() {
                              weight++;
                            });
                          },),
                      ],
                    )
                  ],

                ),
                )),
                Expanded(child: ReusableCard(clr: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'AGE',
                      style: kLabelTextStyle,
                    ),
                    Text(
                      age.toString(),
                      style: kNumberTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RoundIconButton(icon: FontAwesomeIcons.minus, onPressed: (){
                          setState(() {
                            age--;
                          });
                        }),
                        SizedBox(
                          width: 10.0,
                        ),
                        RoundIconButton(icon: FontAwesomeIcons.plus, onPressed: (){
                          setState(() {
                            age++;
                          });
                        })
                      ],
                    )

                  ],
                ),
                )),
              ],
            )),
            BottomButton(buttonTitle: 'CALCULATE', onTap: (){

              CalculatorBrain calc = CalculatorBrain(height: height, weight: weight);



              Navigator.push(context, MaterialPageRoute(builder: (context) => ResultsPage(
                bmiResult: calc.calculateBMI(),
                resultText: calc.getResult(),
                interpretation: calc.getInterpretation(),
              )));
            },),
          ],
        ));
  }
}


