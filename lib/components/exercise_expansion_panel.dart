import 'package:fitness_copilot/components/exercise_set_tile.dart';
import 'package:fitness_copilot/models/exercise.dart';
import 'package:fitness_copilot/models/workout.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExerciseExpansionPanel extends StatelessWidget {
  const ExerciseExpansionPanel({Key? key}) : super(key: key);

  ExpansionPanelRadio _buildExpansionPanelRadio(Exercise exercise, int value) {
    return ExpansionPanelRadio(
      value: value,
      canTapOnHeader: true,
      headerBuilder: (BuildContext context, bool isExpanded) {
        return ListTile(
          title: Text(
            exercise.name,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w400,
                  fontSize: 18.0,
                  overflow: TextOverflow.ellipsis,
                ),
          ),
          subtitle: Text('${exercise.sets.length} sets'),
        );
      },
      body: ListView.separated(
        shrinkWrap: true,
        itemCount: exercise.sets.length,
        itemBuilder: (BuildContext context, int index) {
          return MultiProvider(
            providers: [
              ChangeNotifierProvider.value(value: exercise),
              ChangeNotifierProvider.value(value: exercise.sets[index])
            ],
            child: const ExerciseSetTile(),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider(height: 1.0);
        },
      ),
    );
  }

  List<ExpansionPanelRadio> _getChildren(List<Exercise> exercises) {
    List<ExpansionPanelRadio> children = [];
    for (var i = 0; i < exercises.length; i++) {
      children.add(_buildExpansionPanelRadio(exercises[i], i + 1));
    }

    return children;
  }

  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList.radio(
      initialOpenPanelValue: 1,
      children: _getChildren(context.watch<Workout>().exercises),
    );
  }
}
