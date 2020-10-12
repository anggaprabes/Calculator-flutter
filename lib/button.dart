import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  String label;
  Function onClicked;
  Button({@required this.label, @required this.onClicked});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
        onPressed: () => onClicked(label),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 35,
            color: Colors.black,
          ),
        ),
        shape: CircleBorder(),
        color: Colors.white,
        padding: EdgeInsets.all(20),
      ),
    );
  }
}
