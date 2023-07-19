import 'package:flutter/material.dart';

void showLoading(BuildContext context, String message,
    {bool isCancellable = true}) {
  showDialog(
    context: context,
    barrierDismissible: isCancellable,
    builder: (context) {
      return AlertDialog(
        title: Row(
          children: [Text(message),
            CircularProgressIndicator()],
        ),
      );
    },
  );
}

void hideLoading(BuildContext context) {
  Navigator.pop(context);
}

void showMessage(
    BuildContext context,
    String message,
    String description,
    String posBotton,
    VoidCallback posAction,

    {bool isCancellable = true, String? negBotton,
      VoidCallback? negAction,}) {
  showDialog(
    context: context,
    barrierDismissible: isCancellable,
    builder: (context) {
      List<Widget> Actions = [
        TextButton(onPressed: posAction, child: Text(posBotton)),
      ];
      if (negBotton != null) {
        Actions.add(TextButton(onPressed: negAction, child: Text(negBotton)));
      }
      return AlertDialog(
        title: Text(message),
        content: Text(description),
        actions: Actions,
      );
    },
  );
}
