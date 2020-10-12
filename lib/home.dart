import 'package:flutter/material.dart';
import 'package:calculator/button.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String temp = '0';
  String result = '0';
  double num1 = 0;
  double num2 = 0;

  void buttonPressed(String label) {
    setState(() {
      if (label == 'AC') {
        temp = '0';
        result = '0';
      } else if (label == '⌫') {
        temp = temp.substring(0, temp.length - 1);
        if (temp == "") {
          temp = "0";
          result = temp;
        }
      } else if (label == '=') {
        if (temp.contains('+')) {
          List<String> splitAdd = temp.split('+');
          temp += temp;
          num1 = double.parse(splitAdd[0]);
          num2 = double.parse(splitAdd[1]);
          temp = (num1 + num2).toString();
        } else if (temp.contains('-')) {
          temp=splitMinus(temp);
          List<String> splitSubstract = temp.split('-');
          temp += temp;
          num1 = double.parse(splitSubstract[0]);
          num2 = double.parse(splitSubstract[1]);
          temp = (num1 - num2).toString();
        } else if (temp.contains('x')) {
          splitMinus(temp);
          List<String> splitMultiply = temp.split('x');
          temp += temp;
          num1 = double.parse(splitMultiply[0]);
          num2 = double.parse(splitMultiply[1]);
          temp = (num1 * num2).toString();
        } else if (temp.contains(':')) {
          splitMinus(temp);
          List<String> splitDivide = temp.split(':');
          temp += temp;
          num1 = double.parse(splitDivide[0]);
          num2 = double.parse(splitDivide[1]);
          temp = (num1 / num2).toString();
        }
        temp = doesContainDecimal(temp);
        result = temp;
      } else if (label == '%') {
        temp = (num1 / 100) as String;
        result = doesContainDecimal(temp);
      } else if (label == '.') {
        if (!temp.contains('.')) {
          temp = temp + '.';
        }
        temp = temp;
      } else if (label == '+/-') {
        if (temp == '0') {
          temp = '-';
        } else
          temp.startsWith('-') ? temp = temp.substring(1) : temp = '-' + temp;
        result = temp;
      } else {
        if (temp == '0') {
          temp = label;
        } else {
          temp += label;
        }
      }
    });
  }

  splitMinus(temporary) {
    temp = temporary;
    if (temp.startsWith('-')) {
      List<String> splitMinus = temp.split('-');
      return temp = splitMinus[1].toString();
    }
    return temp;
  }

  String doesContainDecimal(dynamic result) {
    if (result.toString().contains('.')) {
      //misal nilai 15.0
      List<String> splitDecimal =
          result.toString().split('.'); // split('.') => list = [15], [0]
      if (!(int.parse(splitDecimal[1]) > 0)) // jika ((0 > 0) == false)
        return result = splitDecimal[0].toString();
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              alignment: Alignment.bottomRight,
              padding: EdgeInsets.only(right: 10),
              child: Text(
                temp,
                style: TextStyle(
                  color: Colors.amberAccent,
                  fontSize: 50,
                ),
              ),
            ),
            Container(
              alignment: Alignment.bottomRight,
              padding: EdgeInsets.only(right: 10),
              child: Text(
                result,
                style: TextStyle(
                  color: Colors.amberAccent,
                  fontSize: 80,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RaisedButton(
                  padding: EdgeInsets.fromLTRB(34, 20, 128, 20),
                  onPressed: () {
                    buttonPressed('AC');
                  },
                  shape: StadiumBorder(),
                  child: Text(
                    'AC',
                    style: TextStyle(fontSize: 35, color: Colors.black),
                  ),
                  color: Colors.white,
                ),
                Button(label: '⌫', onClicked: buttonPressed),
                Button(label: '=', onClicked: buttonPressed),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Button(label: '1', onClicked: buttonPressed),
                Button(label: '2', onClicked: buttonPressed),
                Button(label: '3', onClicked: buttonPressed),
                Button(label: 'x', onClicked: buttonPressed),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Button(label: '4', onClicked: buttonPressed),
                Button(label: '5', onClicked: buttonPressed),
                Button(label: '6', onClicked: buttonPressed),
                Button(label: ':', onClicked: buttonPressed),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Button(label: '7', onClicked: buttonPressed),
                Button(label: '8', onClicked: buttonPressed),
                Button(label: '9', onClicked: buttonPressed),
                Button(label: '+', onClicked: buttonPressed),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Button(label: '0', onClicked: buttonPressed),
                Button(label: '.', onClicked: buttonPressed),
                Button(label: '+/-', onClicked: buttonPressed),
                Button(label: '-', onClicked: buttonPressed),
              ],
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
