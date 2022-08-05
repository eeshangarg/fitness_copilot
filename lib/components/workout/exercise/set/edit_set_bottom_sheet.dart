import 'package:fitness_copilot/components/workout/exercise/set/rep_text_field.dart';
import 'package:fitness_copilot/components/workout/exercise/set/weight_text_field.dart';
import 'package:fitness_copilot/models/workout/exercise/exercise_set.dart';
import 'package:fitness_copilot/models/workout/exercise/exercise_template.dart';
import 'package:fitness_copilot/shared/style_constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class EditSetBottomSheet extends StatefulWidget {
  const EditSetBottomSheet({Key? key}) : super(key: key);

  @override
  State<EditSetBottomSheet> createState() => _EditSetBottomSheetState();
}

class _EditSetBottomSheetState extends State<EditSetBottomSheet> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final repGoalEditingController = TextEditingController();
  final repsPerformedEditingController = TextEditingController();
  final weightEditingController = TextEditingController();

  @override
  void dispose() {
    repGoalEditingController.dispose();
    repsPerformedEditingController.dispose();
    weightEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ExerciseSet set = context.watch<ExerciseSet>();
    ExerciseTemplate exerciseTemplate = context.watch<ExerciseTemplate>();
    int setNumber = exerciseTemplate.sets.indexOf(set) + 1;

    repGoalEditingController.text = set.repGoal.toString();

    return Container(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: kComponentPadding,
            child: Column(
              children: [
                Text(
                  'Edit Set $setNumber',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 4.0),
                Text(
                  exerciseTemplate.name,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 16.0),
                WeightTextField(
                  labelText: 'Weight (in lbs)',
                  helperText: 'e.g. 20 lbs',
                  icon: FontAwesomeIcons.weightHanging,
                  controller: weightEditingController,
                ),
                const SizedBox(height: 16.0),
                RepTextField(
                  labelText: 'Reps performed',
                  helperText: 'e.g. 10 reps performed',
                  icon: FontAwesomeIcons.dumbbell,
                  controller: repsPerformedEditingController,
                ),
                const SizedBox(height: 16.0),
                RepTextField(
                  labelText: 'Rep goal',
                  helperText: 'e.g. 15 reps',
                  icon: FontAwesomeIcons.bullseye,
                  controller: repGoalEditingController,
                ),
                const SizedBox(height: 16.0),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        child: const Text('Done'),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            set.update(
                              repGoal: int.parse(repGoalEditingController.text),
                              weight:
                                  double.parse(weightEditingController.text),
                              repsPerformed: int.parse(
                                  repsPerformedEditingController.text),
                            );
                            Navigator.pop(context);
                          }
                        },
                      ),
                    ),
                    const SizedBox(width: 16.0),
                    Expanded(
                      child: ElevatedButton(
                        child: const Text('Cancel'),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
