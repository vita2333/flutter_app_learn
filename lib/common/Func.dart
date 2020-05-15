import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showToast(String text,
    {gravity: ToastGravity.CENTER, toastLength: Toast.LENGTH_SHORT}) {
  Fluttertoast.showToast(
      msg: text,
      toastLength: toastLength,
      gravity: gravity,
      timeInSecForIos: 1,
      backgroundColor: Colors.grey[600],
      fontSize: 16);
}

void showLoading(BuildContext context, [String text]) {
  text = text ?? 'loading...';
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return Center(
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(3),
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)]),
            padding: EdgeInsets.all(16),
            margin: EdgeInsets.all(16),
            constraints: BoxConstraints(minHeight: 120, minWidth: 180),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 30,
                  width: 30,
                  child: CircularProgressIndicator(
                    strokeWidth: 3,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text(
                    text,
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                )
              ],
            ),
          ),
        );
      });
}
