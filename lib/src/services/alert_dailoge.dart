import 'package:flutter/material.dart';

showAlertDialog(
    {required BuildContext context,
    required void Function()? onPressedNo,
    required void Function()? onPressedYes,

    String? title,
    required String subtitle}) {
  // // set up the buttons
  // Widget cancelButton = TextButton(
  //   onPressed: onPressedNo,
  //   child: Text(
  //     cancelButtonName,
  //     style: Theme.of(context).textTheme.headline3,
  //   ),
  // );

  // Widget continueButton = TextButton(
  //     onPressed: onPressedYes,
  //     child: Text(
  //       actionButtonName,
  //       style: Theme.of(context).textTheme.headline3,
  //     ));

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    titlePadding: EdgeInsets.zero,
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (title != null)
          Text(
            title,
            style: Theme.of(context).textTheme.headline3,
          ),
        if (title != null)
          const SizedBox(
            height: 10,
          ),
        Text(
          subtitle,
          style: Theme.of(context).textTheme.headline3,
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 10,
        ),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //     Flexible(flex: 1, child: Center(child: cancelButton)),
        //     Container(
        //       height: 25,
        //       width: 2,
        //       color: Colors.grey,
        //     ),
        //     Flexible(flex: 1, child: Center(child: continueButton)),
        //   ],
        // )
      ],
    ),
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return WillPopScope(
          onWillPop: () {
            if(onPressedNo!=null) {
              onPressedNo();
            }
            return Future.value(true);
          },
          child: alert);
    },
  );
}
