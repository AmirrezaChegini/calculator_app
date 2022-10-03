import 'package:calculator_app/data/constant.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class MainApplication extends StatefulWidget {
  const MainApplication({Key? key}) : super(key: key);

  @override
  State<MainApplication> createState() => _MainApplicationState();
}

class _MainApplicationState extends State<MainApplication> {
  String exp = '';
  String result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blueGrey900,
      body: _getBody(),
    );
  }

  Widget _getBody() {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            flex: 35,
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: blueGrey900,
              ),
              child: _getTexts(),
            ),
          ),
          Expanded(
            flex: 65,
            child: Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: blueGrey700,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: Column(
                  children: [
                    _getButtons('C', 'DE', '(', ')'),
                    _getButtons('7', '8', '9', '/'),
                    _getButtons('4', '5', '6', 'x'),
                    _getButtons('1', '2', '3', '+'),
                    _getButtons('.', '0', '=', '-'),
                  ],
                )),
          ),
        ],
      ),
    );
  }

  Widget _getTexts() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          exp,
          style: TextStyle(color: white, fontSize: 26),
        ),
        SizedBox(height: 10),
        Text(
          result,
          style: TextStyle(
              color: white, fontSize: 36, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20),
      ],
    );
  }

  Widget _getButtons(String t1, String t2, String t3, String t4) {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: TextButton(
                onPressed: () => Calculate(t1),
                child: Text(t1),
                style: TextButton.styleFrom(
                  backgroundColor: blueGrey900,
                  foregroundColor: getTextColor(t1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(26),
                  ),
                  textStyle: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: TextButton(
                onPressed: () => Calculate(t2),
                child: Text(t2),
                style: TextButton.styleFrom(
                  backgroundColor: blueGrey900,
                  foregroundColor: getTextColor(t2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(26),
                  ),
                  textStyle: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: TextButton(
                onPressed: () => Calculate(t3),
                child: Text(t3),
                style: TextButton.styleFrom(
                  backgroundColor: blueGrey900,
                  foregroundColor: getTextColor(t3),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(26),
                  ),
                  textStyle: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: TextButton(
                onPressed: () => Calculate(t4),
                child: Text(t4),
                style: TextButton.styleFrom(
                  backgroundColor: blueGrey900,
                  foregroundColor: getTextColor(t4),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(26),
                  ),
                  textStyle: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Color getTextColor(String x) {
    List<String> numbers = [
      '0',
      '1',
      '2',
      '3',
      '4',
      '5',
      '6',
      '7',
      '8',
      '9',
      '.'
    ];
    List<String> operatos = ['(', ')', '/', 'x', '+', '-', '='];
    List<String> clears = ['C', 'DE'];

    if (numbers.contains(x)) {
      return white;
    } else if (operatos.contains(x)) {
      return green;
    } else if (clears.contains(x)) {
      return orange;
    }

    return white;
  }

  void Calculate(String x) {
    setState(() {
      List<String> clearsResult = ['C', 'DE', '='];

      if (!clearsResult.contains(x) && result != '') {
        exp = result;
        result = '';
        exp += x;
      } else if (!clearsResult.contains(x)) {
        exp += x;
      } else if (x == 'DE') {
        exp = exp.substring(0, exp.length - 1);
      } else if (x == 'C') {
        exp = '';
        result = '';
      } else {
        Parser parser = Parser();
        Expression e = parser.parse(exp.replaceAll('x', '*'));
        ContextModel cm = ContextModel();
        result = e.evaluate(EvaluationType.REAL, cm).toString();
      }
    });
  }
}
