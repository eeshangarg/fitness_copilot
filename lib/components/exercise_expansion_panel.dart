import 'package:fitness_copilot/components/exercise_set_tile.dart';
import 'package:fitness_copilot/models/exercise.dart';
import 'package:flutter/material.dart';

class ExerciseExpansionPanel extends StatelessWidget {
  const ExerciseExpansionPanel({
    Key? key,
    required List<Exercise> exercises,
  })  : _exercises = exercises,
        super(key: key);

  final List<Exercise> _exercises;

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
          return ExerciseSetTile(
            set: exercise.sets[index],
            setNumber: index + 1,
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider(height: 1.0);
        },
      ),
    );
  }

  List<ExpansionPanelRadio> _getChildren() {
    List<ExpansionPanelRadio> children = [];
    for (var i = 0; i < _exercises.length; i++) {
      children.add(_buildExpansionPanelRadio(_exercises[i], i + 1));
    }

    return children;
  }

  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList.radio(
      initialOpenPanelValue: 1,
      children: _getChildren(),
    );
  }
}
