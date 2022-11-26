import 'package:flutter/material.dart';

ButtonStyle buttonStyle = ElevatedButton.styleFrom(
    shape: RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(30.0),
));

const focusedBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(
    Radius.circular(30.0),
  ),
  borderSide: BorderSide(
    width: 2,
    color: Colors.white,
  ),
);

const errorBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(
    Radius.circular(30.0),
  ),
  borderSide: BorderSide(
    width: 2,
    color: Colors.red,
  ),
);

const enabledBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(
    Radius.circular(30.0),
  ),
  borderSide: BorderSide(
    width: 1,
    color: Colors.white,
  ),
);

InputDecoration formDecoration(String labelText, {IconData? iconData}) {
  return InputDecoration(
      errorStyle: const TextStyle(
        fontSize: 10,
      ),
      //counterText: '',
      prefixIcon: Icon(
        iconData,
        color: Colors.white,
      ),
      errorMaxLines: 3,
      labelText: labelText,
      labelStyle: const TextStyle(color: Colors.blue),
      enabledBorder: enabledBorder,
      focusedBorder: focusedBorder,
      errorBorder: errorBorder,
      focusedErrorBorder: errorBorder);
}
