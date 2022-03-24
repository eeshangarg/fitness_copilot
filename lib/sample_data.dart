import 'package:fitness_copilot/models/exercise.dart';
import 'package:fitness_copilot/models/workout.dart';

Exercise facePulls = Exercise(name: 'Face Pull (Cable)');
Exercise overheadPress = Exercise(name: 'Overhead Press (Dumbbell)');
Exercise chestDip = Exercise(name: 'Chest Dip');
Exercise shoulderRaises = Exercise(
  name: 'Seated DB Front + Lateral + Rear Delt Raises',
);
Exercise widePullUp = Exercise(name: 'Wide Pull Up');
Exercise seatedCalfRaise = Exercise(name: 'Seated Calf Raise (Machine)');
Exercise standingCalfRaise = Exercise(name: 'Standing Calf Raise (Machine)');

Workout shouldersWorkout = Workout(
  name: 'Shoulders & Chest',
  exercises: [
    facePulls,
    overheadPress,
    chestDip,
    shoulderRaises,
    widePullUp,
    seatedCalfRaise,
    standingCalfRaise,
  ],
);

List<Workout> sampleWorkouts = [
  shouldersWorkout,
];
