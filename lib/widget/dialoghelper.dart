import 'package:flutter/material.dart';
import 'package:shopify/widget/popDialogBox.dart';

class DialogHelper {
  static exit(context) => showDialog(
      context: context, builder: (context) => ExitConfirmationDialog());
}
