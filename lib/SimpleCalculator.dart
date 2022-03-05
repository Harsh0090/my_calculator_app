import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class SimpleCalculator extends StatefulWidget {
  const SimpleCalculator({Key? key}) : super(key: key);

  @override
  State<SimpleCalculator> createState() => _SimpleCalculatorState();
}

class _SimpleCalculatorState extends State<SimpleCalculator> {
  String equation = "0";
  String result = "0";
  String expression = "";
  double equationFontSize = 38.0;
  double resultFontSize = 48.0;

  buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == "C") {
        double equationFontSize = 38.0;
        double resultFontSize = 48.0;
        result = "0";
        equation = "0";
      } else if (buttonText == "X") {
        double equationFontSize = 38.0;
        double resultFontSize = 48.0;
        equation = equation.substring(0, equation.length - 1);
        if (equation == "") {
          equation = "0";
        }
      } else if (buttonText == "=") {
        double equationFontSize = 38.0;
        double resultFontSize = 48.0;

        expression = equation;
        expression = expression.replaceAll('x', '*');
        expression = expression.replaceAll('/', '/');

        try {
          Parser p = new Parser();
          Expression exp = p.parse(expression);

          ContextModel cm = ContextModel();
          result = '${exp.evaluate(EvaluationType.REAL, cm)}';
        } catch (e) {
          result = "Error";
        }
      } else {
        equationFontSize = 48.0;
        resultFontSize = 38.0;
        if (equation == "0") {
          equation = buttonText;
        } else {
          equation = equation + buttonText;
        }
      }
    });
  }

  Widget buildButton(
      {required String buttonText,
      required double buttonHeight,
      required Color buttonColor}) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1 * buttonHeight,
      color: buttonColor,
      child: FlatButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0.0),
            side: BorderSide(
                color: Colors.white, width: 1, style: BorderStyle.solid)),
        padding: EdgeInsets.all(15.0),
        onPressed: () => buttonPressed(buttonText),
        child: Text(
          buttonText,
          style: TextStyle(
              fontSize: 32.0,
              fontWeight: FontWeight.normal,
              color: Colors.white),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Simple Calculator"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: Text(
              equation,
              style: TextStyle(fontSize: equationFontSize),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.fromLTRB(10, 30, 10, 0),
            child: Text(
              equation,
              style: TextStyle(fontSize: resultFontSize),
            ),
          ),
          Expanded(
            child: Divider(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * .75,
                child: Table(
                  children: [
                    TableRow(children: [
                      buildButton(
                          buttonText: "C",
                          buttonHeight: 1,
                          buttonColor: Colors.blueAccent),
                      buildButton(
                          buttonText: "X",
                          buttonHeight: 1,
                          buttonColor: Colors.greenAccent),
                      buildButton(
                          buttonText: "/",
                          buttonHeight: 1,
                          buttonColor: Colors.redAccent),
                    ]),
                    TableRow(children: [
                      buildButton(
                          buttonText: "7",
                          buttonHeight: 1,
                          buttonColor: Colors.black),
                      buildButton(
                          buttonText: "8",
                          buttonHeight: 1,
                          buttonColor: Colors.black),
                      buildButton(
                          buttonText: "9",
                          buttonHeight: 1,
                          buttonColor: Colors.black),
                    ]),
                    TableRow(children: [
                      buildButton(
                          buttonText: "4",
                          buttonHeight: 1,
                          buttonColor: Colors.black),
                      buildButton(
                          buttonText: "5",
                          buttonHeight: 1,
                          buttonColor: Colors.black),
                      buildButton(
                          buttonText: "6",
                          buttonHeight: 1,
                          buttonColor: Colors.black),
                    ]),
                    TableRow(children: [
                      buildButton(
                          buttonText: "1",
                          buttonHeight: 1,
                          buttonColor: Colors.black),
                      buildButton(
                          buttonText: "2",
                          buttonHeight: 1,
                          buttonColor: Colors.black),
                      buildButton(
                          buttonText: "3",
                          buttonHeight: 1,
                          buttonColor: Colors.black),
                    ]),
                    TableRow(children: [
                      buildButton(
                          buttonText: ".",
                          buttonHeight: 1,
                          buttonColor: Colors.black),
                      buildButton(
                          buttonText: "0",
                          buttonHeight: 1,
                          buttonColor: Colors.black),
                      buildButton(
                          buttonText: "00",
                          buttonHeight: 1,
                          buttonColor: Colors.black),
                    ]),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.25,
                child: Table(
                  children: [
                    TableRow(children: [
                      buildButton(
                          buttonText: "*",
                          buttonHeight: 1,
                          buttonColor: Colors.blue),
                    ]),
                    TableRow(children: [
                      buildButton(
                          buttonText: "-",
                          buttonHeight: 1,
                          buttonColor: Colors.blue),
                    ]),
                    TableRow(children: [
                      buildButton(
                          buttonText: "+",
                          buttonHeight: 1,
                          buttonColor: Colors.blue),
                    ]),
                    TableRow(children: [
                      buildButton(
                          buttonText: "/",
                          buttonHeight: 1,
                          buttonColor: Colors.blue),
                    ]),
                    TableRow(children: [
                      buildButton(
                          buttonText: "=",
                          buttonHeight: 1,
                          buttonColor: Colors.blue),
                    ]),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
