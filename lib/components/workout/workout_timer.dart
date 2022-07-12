import 'package:fitness_copilot/shared/providers/timer_service.dart';
import 'package:flutter/material.dart';

class WorkoutTimer extends StatefulWidget {
  const WorkoutTimer({Key? key}) : super(key: key);

  @override
  State<WorkoutTimer> createState() => _WorkoutTimerState();
}

class _WorkoutTimerState extends State<WorkoutTimer> {
  @override
  Widget build(BuildContext context) {
    TimerService timerService = TimerService.of(context);
    timerService.start();
    return AnimatedBuilder(
      animation: timerService,
      builder: (context, child) {
        int minutes = timerService.currentDuration.inMinutes;
        String twoDigits(int n) => n.toString().padLeft(2, "0");
        String seconds = twoDigits(
          timerService.currentDuration.inSeconds.remainder(60),
        );
        return Text('$minutes:$seconds');
      },
    );
  }
}
