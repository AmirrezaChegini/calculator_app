import 'package:calculator_app/controller/cal_ctrl.dart';
import 'package:calculator_app/data/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainApplication extends StatelessWidget {
  final calCtrl = Get.put(CalCtrl());

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
        Obx(
          () => Text(
            calCtrl.exp.value,
            style: TextStyle(color: white, fontSize: 26),
          ),
        ),
        SizedBox(height: 10),
        Obx(
          () => Text(
            calCtrl.result.value,
            style: TextStyle(
                color: white, fontSize: 36, fontWeight: FontWeight.bold),
          ),
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
                onPressed: () => calCtrl.calculate(t1),
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
                onPressed: () => calCtrl.calculate(t2),
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
                onPressed: () => calCtrl.calculate(t3),
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
                onPressed: () => calCtrl.calculate(t4),
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
}
