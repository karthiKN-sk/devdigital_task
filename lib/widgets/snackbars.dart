import 'package:devdigital_task/utils/extension.dart';
import 'package:flutter/material.dart';

isSuccessSnackBar(
  BuildContext context, {
  required String message,
}) {
  return ScaffoldMessenger.of(context).showSnackBar(
    showSimpleSnackbar(
      context,
      backgroundColor: Colors.green,
      text: message.toTitleCaze(),
      textcolor: Colors.white,
      time: 1,
    ),
  );
}

isErrorSnackBar(
  BuildContext context, {
  required String message,
}) {
  return ScaffoldMessenger.of(context).showSnackBar(
    showSimpleSnackbar(
      context,
      backgroundColor: Colors.red,
      text: message.toTitleCaze(),
      textcolor: Colors.white,
      time: 1,
    ),
  );
}

showSimpleSnackbar(
  BuildContext context, {
  required Color backgroundColor,
  required String text,
  required Color textcolor,
  required int time,
}) {
  return SnackBar(
    margin: const EdgeInsets.only(
      right: 5,
      left: 5,
      bottom: 5,
    ),
    content: Text(
      text,
      style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: textcolor),
    ),
    backgroundColor: backgroundColor,
    duration: Duration(seconds: time),
    behavior: SnackBarBehavior.floating,
  );
}
