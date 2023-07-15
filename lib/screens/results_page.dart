import 'package:bmicalculator/constants.dart';
import 'package:flutter/material.dart';
import 'package:bmicalculator/components/reusable_card.dart';
import 'package:bmicalculator/components/bottomButton.dart';

class ResultsPage extends StatelessWidget {

  ResultsPage({required this.bmiResult, required this.resultText, required this.interpretation});

    final String bmiResult;
    final String resultText;
    final String interpretation;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: Container(
            padding: EdgeInsets.all(15.0),
            alignment: Alignment.bottomLeft,
            child: Text('Your Result', style: kTitleTextStyle,),
          )),
          Expanded(flex: 5,
          child: ReusableCard(clr: kActiveCardColor,
          cardChild: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(resultText.toUpperCase(), style: kResultTextStyle,),
              Text(
                bmiResult.toUpperCase(),
                style: kBMITextStyle,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 2.0, right: 2.0),
                child: Text(
                  interpretation.toUpperCase(),
                  style: kBodyTextStyle,
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),),
          ),
          BottomButton(onTap: (){
            Navigator.pop(context);
          }, buttonTitle: 'RE-CALCULATE')
        ],
      ),
    );
  }
}
