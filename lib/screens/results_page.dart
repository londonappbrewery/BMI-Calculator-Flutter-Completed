import 'package:auto_size_text/auto_size_text.dart';
import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class  ResultsPageArgs {
  ResultsPageArgs({@required this.interpretation, @required this.bmiResult, @required this.resultText});
  final String bmiResult, resultText, interpretation;
}

class ResultsPage extends StatelessWidget {
  static final route = "/result";

  @override
  Widget build(BuildContext context) {
    final ResultsPageArgs args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: kMainMargin, right: kMainMargin),
              alignment: Alignment.center,
              child: AutoSizeText(
                'Your Result',
                style: kTitleTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: kActiveCardColour,
              cardChild: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      args.resultText.toUpperCase(),
                      style: kResultTextStyle,
                    ),
                    Text(
                      args.bmiResult,
                      style: kBMITextStyle,
                    ),
                    Text(
                      args.interpretation,
                      textAlign: TextAlign.center,
                      style: kBodyTextStyle,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 24, bottom: 16, left: kMainMargin, right: kMainMargin),
            child: BottomButton(
              buttonTitle: 'RE-CALCULATE',
              onTap: () => Navigator.pop(context)
            ),
          )
        ],
      ),
    );
  }
}
