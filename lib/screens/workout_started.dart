import 'package:fitness_copilot/components/confirmation_alert_dialog.dart';
import 'package:fitness_copilot/components/workout/exercise/exercise_expansion_panel.dart';
import 'package:fitness_copilot/components/workout/workout_timer.dart';
import 'package:fitness_copilot/models/workout/workout_performed.dart';
import 'package:fitness_copilot/models/workout/workout_template.dart';
import 'package:fitness_copilot/shared/providers/timer_service.dart';
import 'package:fitness_copilot/shared/style_constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class WorkoutStarted extends StatelessWidget {
  const WorkoutStarted({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WorkoutTemplate workoutTemplate = context.watch<WorkoutTemplate>();
    WorkoutPerformed workoutPerformed = WorkoutPerformed.fromTemplate(
      workoutTemplate,
    );

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(workoutTemplate.name),
            const WorkoutTimer(),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return ConfirmationAlertDialog(
                    title: 'Finish workout?',
                    contentMessage:
                        'Are you sure you want to finish this workout?',
                    confirmationButtonText: 'Finish',
                    onPressedConfirmation: () {
                      workoutTemplate.setLastPerformed(
                        workoutPerformed.creationDate!,
                      );
                      workoutTemplate.update();
                      workoutPerformed.add();
                      TimerService timerService = TimerService.of(context);
                      timerService.stop();
                      timerService.reset();
                      Navigator.pop(context);
                    },
                  );
                },
              );
            },
            icon: const Icon(FontAwesomeIcons.solidCircleCheck),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: kScreenPadding,
          child: ChangeNotifierProvider.value(
            value: workoutPerformed,
            child: const ExerciseExpansionPanel(),
          ),
        ),
      ),
    );
  }
}
