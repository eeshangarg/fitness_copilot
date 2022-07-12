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
      visualDensity: const VisualDensity(
        vertical: VisualDensity.minimumDensity,
        horizontal: VisualDensity.minimumDensity,
      ),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 0.0,
      ),
      horizontalTitleGap: 2.0,
    );
  }
}
