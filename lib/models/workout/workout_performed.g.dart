// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_performed.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkoutPerformed _$WorkoutPerformedFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['name', 'creation_date'],
  );
  return WorkoutPerformed(
    name: json['name'] as String,
    exercises: (json['exercises'] as List<dynamic>?)
            ?.map((e) => ExercisePerformed.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
  )..creationDate = json['creation_date'] as int?;
}

Map<String, dynamic> _$WorkoutPerformedToJson(WorkoutPerformed instance) =>
    <String, dynamic>{
      'name': instance.name,
      'exercises': instance.exercises.map((e) => e.toJson()).toList(),
      'creation_date': instance.creationDate,
    };
