import 'package:json_annotation/json_annotation.dart';

part 'exercise_set.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ExerciseSet {
  @JsonKey(defaultValue: 0)
  int repGoal;

  @JsonKey(defaultValue: 0.0)
  double weight = 0.0; // in lbs

  @JsonKey(defaultValue: 0)
  int repsPerformed = 0;

  ExerciseSet({
    required this.repGoal,
    required this.weight,
    this.repsPerformed = 0,
  });

  factory ExerciseSet.fromJson(Map<String, dynamic> json) =>
      _$ExerciseSetFromJson(json);

  Map<String, dynamic> toJson() => _$ExerciseSetToJson(this);
}
