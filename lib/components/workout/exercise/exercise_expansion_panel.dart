import 'package:fitness_copilot/components/workout/exercise/exercise_set_tile.dart';
import 'package:fitness_copilot/models/workout/exercise/exercise_template.dart';
import 'package:fitness_copilot/models/workout/workout_template.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExerciseExpansionPanel extends StatelessWidget {
  const ExerciseExpansionPanel({Key? key}) : super(key: key);

  ExpansionPanelRadio _buildExpansionPanelRadio(
    ExerciseTemplate exerciseTemplate,
    int value,
  ) {
    return ExpansionPanelRadio(
      value: value,
      canTapOnHeader: true,
      headerBuilder: (BuildContext context, bool isExpanded) {
        return ListTile(
          title: Text(
            exerciseTemplate.name,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  overflow: TextOverflow.ellipsis,
                ),
          ),
          subtitle: Text('${exerciseTemplate.sets.length} sets'),
        );
      },
      body: ListView.separated(
        shrinkWrap: true,
        itemCount: exerciseTemplate.sets.length,
        itemBuilder: (BuildContext context, int index) {
          return MultiProvider(
            providers: [
              ChangeNotifierProvider.value(value: exerciseTemplate),
              ChangeNotifierProvider.value(value: exerciseTemplate.sets[index])
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

  List<ExpansionPanelRadio> _getChildren(
    List<ExerciseTemplate> exerciseTemplates,
  ) {
    List<ExpansionPanelRadio> children = [];
    for (var i = 0; i < exerciseTemplates.length; i++) {
      children.add(_buildExpansionPanelRadio(exerciseTemplates[i], i + 1));
    }

    return children;
  }

  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList.radio(
      initialOpenPanelValue: 1,
      children: _getChildren(context.watch<WorkoutTemplate>().exercises),
    );
  }
}
