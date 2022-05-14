// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise_set.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExerciseSet _$ExerciseSetFromJson(Map<String, dynamic> json) => ExerciseSet(
      repGoal: json['rep_goal'] as int? ?? 0,
      weight: (json['weight'] as num?)?.toDouble() ?? 0.0,
      numberOfRepsPerformed: json['number_of_reps_performed'] as int? ?? 0,
    );

Map<String, dynamic> _$ExerciseSetToJson(ExerciseSet instance) =>
    <String, dynamic>{
      'rep_goal': instance.repGoal,
      'weight': instance.weight,
      'number_of_reps_performed': instance.numberOfRepsPerformed,
    };
