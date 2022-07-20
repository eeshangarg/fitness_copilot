import 'package:fitness_copilot/shared/style_constants.dart';
import 'package:flutter/material.dart';

class WorkoutPopupMenuTile extends StatelessWidget {
  const WorkoutPopupMenuTile({
    Key? key,
    required this.title,
    required this.icon,
  }) : super(key: key);

  final Text title;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: title,
      leading: icon,
      visualDensity: kMinimumVisualDensity,
      contentPadding: kZeroHorizontalSymmetricPadding,
      horizontalTitleGap: 2.0,
    );
  }
}
