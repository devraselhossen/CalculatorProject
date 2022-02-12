import 'package:calculator_project/Pages/Button.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var userQuestion = "";
  var userAnswer = "";

  final List<String> buttons = [
    "C",
    "DEl",
    "%",
    "/",
    "9",
    "8",
    "7",
    "*",
    "6",
    "5",
    "4",
    "-",
    "3",
    "2",
    "1",
    "+",
    "0",
    ".",
    "ANS",
    "=",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff121212),
        body: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                          child: Text(
                        userQuestion,
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )),
                      Container(
                          alignment: Alignment.centerRight,
                          child: Text(userAnswer,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20))),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                child: GridView.builder(
                    itemCount: buttons.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4),
                    itemBuilder: (BuildContext context, int index) {
                      // clear button ***************************************************************************
                      if (index == 0) {
                        return MyButton(
                          buttonTapped: (){
                            setState(() {
                              userQuestion = "";
                              userAnswer = "";
                            });
                          },
                          color: Color(0xff1e1e1e),
                          textColor: Color(0xff00ff00),
                          buttonText: buttons[index],
                        );
                      }
                      // delete button ***************************************************************
                      else if (index == 1) {
                        return MyButton(
                          buttonTapped: (){
                            setState(() {
                              userQuestion = userQuestion.substring(0, userQuestion.length-1);
                              userAnswer = "";
                            });
                          },
                          color: Color(0xff1e1e1e),
                          textColor: Color(0xffff0000),
                          buttonText: buttons[index],
                        );
                      }
                      // equal button ****************************************************************************
                      else if (index == buttons.length-1) {
                        return MyButton(
                          buttonTapped: (){
                            setState(() {
                              equallpresed();
                            });
                          },
                          color: Color(0xff1e1e1e),
                          textColor: Colors.yellow,
                          buttonText: buttons[index],
                        );
                      }
                      // all button ***********************************************************************
                      else
                        return MyButton(
                          buttonTapped: (){
                            setState(() {
                              userQuestion += buttons[index];
                            });
                          },
                          color: Color(0xff1e1e1e),
                          textColor: isOperator(buttons[index])
                              ? Colors.yellow
                              : Colors.white,
                          buttonText: buttons[index],
                        );
                    }),
              ),
            ),
          ]
        ));
  }

  bool isOperator(String x) {
    if (x == "%" || x == "/" || x == "*" || x == "-" || x == "+" || x == "=") {
      return true;
    } else {
      return false;
    }
  }

  void equallpresed(){
    String finalQuestion = userQuestion;
    finalQuestion = finalQuestion.replaceAll("x", "*");

    Parser p = Parser();
    Expression exp = p.parse(finalQuestion);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    userAnswer = eval.toString();
  }

}