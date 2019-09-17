import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FToast {
  static show(String msg,
      {ToastGravity gravity = ToastGravity.BOTTOM,
      backgroundColor = Colors.grey,
      textColor = Colors.white}) {

    if(msg == null || !msg.trim().isNotEmpty){
      return;
    }
    
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1,
        backgroundColor: backgroundColor,
        textColor: textColor,
        fontSize: 16.0);
  }

  static showLong(String msg,
      {ToastGravity gravity = ToastGravity.BOTTOM,
      backgroundColor = Colors.grey,
      textColor = Colors.white}) {

    if(msg == null || !msg.trim().isNotEmpty){
      return;
    }

    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_LONG,
        gravity: gravity,
        timeInSecForIos: 3,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
