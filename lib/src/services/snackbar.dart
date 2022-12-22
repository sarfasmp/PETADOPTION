import 'package:flutter/material.dart';

void showSnackBar({required BuildContext context, required Widget content}) {
  var snackBar = SnackBar(
      margin: const EdgeInsets.only(right: 30,left: 30,bottom: 30),
      //width: double.,
      //padding: EdgeInsets.only(left: 30,right: 30),
      backgroundColor: Theme.of(context).indicatorColor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
      ),
      behavior: SnackBarBehavior.floating,
      content: content);
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}