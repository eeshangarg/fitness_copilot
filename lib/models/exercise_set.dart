import 'package:json_annotation/json_annotation.dart';

part 'exercise_set.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ExerciseSet {
  @JsonKey(defaultValue: 0)
  int numberOfReps = 0;

  @JsonKey(defaultValue: 0.0)
  double weight = 0.0; // in lbs

  ExerciseSet({required this.numberOfReps, required this.weight});

  factory ExerciseSet.fromJson(Map<String, dynamic> json) =>
      _$ExerciseSetFromJson(json);

  Map<String, dynamic> toJson() => _$ExerciseSetToJson(this);
}
