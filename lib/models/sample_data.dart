import 'package:fitness_copilot/models/exercise.dart';
import 'package:fitness_copilot/models/workout.dart';

Exercise facePulls = Exercise(
  name: 'Face Pull (Cable)',
  bodyPart: 'Shoulders',
);
Exercise overheadPress = Exercise(
  name: 'Overhead Press (Dumbbell)',
  bodyPart: 'Shoulders',
);
Exercise chestDip = Exercise(
  name: 'Chest Dip',
  bodyPart: 'Chest',
);
Exercise shoulderRaises = Exercise(
  name: 'Seated DB Front + Lateral + Rear Delt Raises',
  bodyPart: 'Shoulders',
);
Exercise widePullUp = Exercise(
  name: 'Wide Pull Up',
  bodyPart: 'Back',
);
Exercise seatedCalfRaise = Exercise(
  name: 'Seated Calf Raise (Machine)',
  bodyPart: 'Legs',
);
Exercise standingCalfRaise = Exercise(
  name: 'Standing Calf Raise (Machine)',
  bodyPart: 'Legs',
);
Exercise tricepPushdown = Exercise(
  name: 'Tricep Pushdown (Cable - Straight Bar)',
  bodyPart: 'Arms',
);
Exercise hammerCurl = Exercise(
  name: 'Hammer Curl (Dumbbell)',
  bodyPart: 'Arms',
);
Exercise tricepPushups = Exercise(
  name: 'Tricep Push-ups',
  bodyPart: 'Arms',
);
Exercise bicepChinups = Exercise(
  name: 'Bicep Dominant Chin-ups',
  bodyPart: 'Arms',
);
Exercise closeGripBenchPress = Exercise(
  name: 'Bench Press - Close Grip (Barbell)',
  bodyPart: 'Arms',
);
Exercise lyingLegCurl = Exercise(
  name: 'Lying Leg Curl (Machine)',
  bodyPart: 'Legs',
);
Exercise gobletSquat = Exercise(
  name: 'Goblet Squat (Kettlebell)',
  bodyPart: 'Legs',
);
Exercise romanianDeadlift = Exercise(
  name: 'Romanian Deadlift (Barbell)',
  bodyPart: 'Legs',
);
Exercise bulgarianSplitSquat = Exercise(
  name: 'Bulgarian Split Squat',
  bodyPart: 'Legs',
);
Exercise legPress = Exercise(
  name: 'Leg Press',
  bodyPart: 'Legs',
);
Exercise oneArmRow = Exercise(
  name: 'Bent Over One Arm Row (Dumbbell)',
  bodyPart: 'Back',
);
Exercise inclineRow = Exercise(
  name: 'Incline Row (Dumbbell)',
  bodyPart: 'Back',
);
Exercise invertedRow = Exercise(
  name: 'Inverted Row (Bodyweight)',
  bodyPart: 'Back',
);
Exercise chinUp = Exercise(
  name: 'Chin Up',
  bodyPart: 'Back',
);
Exercise shrugs = Exercise(
  name: 'Shrug (Dumbbell)',
  bodyPart: 'Back',
);
Exercise backExtension = Exercise(
  name: 'Back Extension',
  bodyPart: 'Back',
);

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
