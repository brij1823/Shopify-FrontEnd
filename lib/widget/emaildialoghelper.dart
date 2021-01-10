import 'package:flutter/material.dart';
import 'package:shopify/widget/email_dialog.dart';

class EmailDialogHelper {
  static exit(context, var nomineeList) => showDialog(
      context: context,
      builder: (context) => EmailExitConfirmationDialog(nomineeList));
}
