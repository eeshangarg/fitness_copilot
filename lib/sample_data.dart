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
Exercise tricepPushdown = Exercise(
  name: 'Tricep Pushdown (Cable - Straight Bar)',
);
Exercise hammerCurl = Exercise(name: 'Hammer Curl (Dumbbell)');
Exercise tricepPushups = Exercise(name: 'Tricep Push-ups');
Exercise bicepChinups = Exercise(name: 'Bicep Dominant Chin-ups');
Exercise closeGripBenchPress = Exercise(
  name: 'Bench Press - Close Grip (Barbell)',
);
Exercise lyingLegCurl = Exercise(name: 'Lying Leg Curl (Machine)');
Exercise gobletSquat = Exercise(name: 'Goblet Squat (Kettlebell)');
Exercise romanianDeadlift = Exercise(name: 'Romanian Deadlift (Barbell)');
Exercise bulgarianSplitSquat = Exercise(name: 'Bulgarian Split Squat');
Exercise legPress = Exercise(name: 'Leg Press');
Exercise oneArmRow = Exercise(name: 'Bent Over One Arm Row (Dumbbell)');
Exercise inclineRow = Exercise(name: 'Incline Row (Dumbbell)');
Exercise invertedRow = Exercise(name: 'Inverted Row (Bodyweight)');
Exercise chinUp = Exercise(name: 'Chin Up');
Exercise shrugs = Exercise(name: 'Shrug (Dumbbell)');
Exercise backExtension = Exercise(name: 'Back Extension');

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
Workout armsWorkout = Workout(
  name: 'Arms',
  exercises: [
    tricepPushdown,
    hammerCurl,
    tricepPushups,
    bicepChinups,
    closeGripBenchPress,
  ],
);
Workout lowerBodyWorkout = Workout(
  name: 'Lower Body',
  exercises: [
    lyingLegCurl,
    gobletSquat,
    romanianDeadlift,
    bulgarianSplitSquat,
    legPress,
    seatedCalfRaise,
    standingCalfRaise,
  ],
);
Workout backWorkout = Workout(
  name: 'Back',
  exercises: [
    oneArmRow,
    inclineRow,
    invertedRow,
    chinUp,
    shrugs,
    backExtension,
  ],
);

List<Workout> sampleWorkouts = [
  shouldersWorkout,
  armsWorkout,
  lowerBodyWorkout,
  backWorkout,
];
