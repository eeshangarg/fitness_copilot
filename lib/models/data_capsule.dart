import 'package:fitness_copilot/models/sample_data/sample_data_initializer.dart';
import 'package:fitness_copilot/models/workout/workout_template_collection.dart';
import 'package:fitness_copilot/models/workout/workouts_performed_collection.dart';

class DataCapsule {
  final WorkoutTemplateCollection workoutTemplates;
  final WorkoutsPerformedCollection workoutsPerformed;

  DataCapsule({
    required this.workoutTemplates,
    required this.workoutsPerformed,
  });

  static Future<DataCapsule> fromFirestore() async {
    await SampleDataInitializer.initialize();
    WorkoutTemplateCollection templates =
        await WorkoutTemplateCollection.fromFirestore();
    WorkoutsPerformedCollection performed =
        await WorkoutsPerformedCollection.fromFirestore();
    return DataCapsule(
      workoutTemplates: templates,
      workoutsPerformed: performed,
    );
  }
}
