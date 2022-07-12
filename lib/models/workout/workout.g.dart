// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Workout _$WorkoutFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['name'],
  );
  return Workout(
    name: json['name'] as String,
    exercises: (json['exercises'] as List<dynamic>?)
            ?.map((e) => Exercise.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
  )..lastPerformed = json['last_performed'] as int?;
}

Map<String, dynamic> _$WorkoutToJson(Workout instance) => <String, dynamic>{
      'name': instance.name,
      'exercises': instance.exercises.map((e) => e.toJson()).toList(),
      'last_performed': instance.lastPerformed,
    };
