import 'package:flutter/material.dart';

class WorkoutLastPerformedIndicator extends StatelessWidget {
  const WorkoutLastPerformedIndicator({
    Key? key,
    required this.lastPerformed,
  }) : super(key: key);

  final int? lastPerformed;

  String _getLastPerformedLabel() {
    if (lastPerformed == null) {
      return 'Never';
    }

    DateTime lastPerformedDate = DateTime.fromMillisecondsSinceEpoch(
      lastPerformed!,
      isUtc: true,
    );
    int daysAgo = DateTime.now().difference(lastPerformedDate).inDays;
    if (daysAgo == 1) {
      return 'Yesterday';
    }
    return '$daysAgo days ago';
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.access_time_filled,
          size: 14.0,
          color: Theme.of(context).textTheme.caption?.color,
        ),
        const SizedBox(width: 6.0),
        Text(
          _getLastPerformedLabel(),
          style: Theme.of(context).textTheme.caption?.copyWith(
                fontSize: 14.0,
              ),
        )
      ],
    );
  }
}
