import 'package:fitness_copilot/shared/style_constants.dart';
import 'package:flutter/material.dart';

class ConfirmationAlertDialog extends StatelessWidget {
  const ConfirmationAlertDialog({
    Key? key,
    required this.title,
    required this.contentMessage,
    required this.confirmationButtonText,
    required this.onPressedConfirmation,
  }) : super(key: key);

  final String title;
  final String contentMessage;
  final String confirmationButtonText;
  final void Function() onPressedConfirmation;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      insetPadding: kComponentPadding,
      title: Text(title),
      content: Center(
        child: Text(
          contentMessage,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            onPressedConfirmation();
            Navigator.pop(context);
          },
          child: Text(confirmationButtonText),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
      ],
    );
  }
}
