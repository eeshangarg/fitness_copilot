// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise_set.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExerciseSet _$ExerciseSetFromJson(Map<String, dynamic> json) => ExerciseSet(
      numberOfReps: json['number_of_reps'] as int,
      weight: (json['weight'] as num).toDouble(),
    );

Map<String, dynamic> _$ExerciseSetToJson(ExerciseSet instance) =>
    <String, dynamic>{
      'number_of_reps': instance.numberOfReps,
      'weight': instance.weight,
    };
