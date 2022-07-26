import 'package:flutter/material.dart';
import 'package:project_photo_learn/my_style.dart';

enum DialogsAction { yes, cancel }

class AlertDialogs {
  static Future<DialogsAction> yesCancelDialog(
    BuildContext context,
    String title,
    String body,
  ) async {
    final action = await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            title: Text(title),
            content: Text(body),
            actions: <Widget>[
              FlatButton(
                  onPressed: () =>
                      Navigator.of(context).pop(DialogsAction.cancel),
                  child: Text(
                    'Cancel',
                    style: TextStyle(
                      color: MyStyle().darkColor,
                      fontSize: 20,
                      fontFamily: 'Poppins',
                    ),
                  )),
              FlatButton(
                  onPressed: () => Navigator.of(context).pop(DialogsAction.yes),
                  child: Text(
                    'Confirm',
                    style: TextStyle(
                      color: MyStyle().darkColor,
                      fontSize: 20,
                      fontFamily: 'Poppins',
                    ),
                  ))
            ],
          );
        });
    return (action != null) ? action : DialogsAction.cancel;
  }
}
