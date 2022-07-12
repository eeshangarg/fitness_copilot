import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'exercise_set.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ExerciseSet extends ChangeNotifier {
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

  void update({
    required int repGoal,
    required double weight,
    required int repsPerformed,
  }) {
    this.repGoal = repGoal;
    this.weight = weight;
    this.repsPerformed = repsPerformed;
    notifyListeners();
  }

  factory ExerciseSet.fromJson(Map<String, dynamic> json) =>
      _$ExerciseSetFromJson(json);

  Map<String, dynamic> toJson() => _$ExerciseSetToJson(this);
}
