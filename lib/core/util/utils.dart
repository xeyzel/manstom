import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  Utils._();

  static void showToast(String message, {Color? color}) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: color ?? Colors.black54,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  static String capital(String text) {
    final texts = text.split(' ');
    final transforms =
        texts.map((e) => e[0].toUpperCase() + e.substring(1).toLowerCase());
    return transforms.join(' ');
  }
}
