import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Utility{
  static String capitalize(String string) {
    if (string == null) {
      throw ArgumentError("string: $string");
    }

    if (string.isEmpty) {
      return string;
    }

    return string[0].toUpperCase() + string.substring(1);
  }

  static showAlertDialog(BuildContext context, String title, String content) {

    // set up the button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: ()  {
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}