// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_template.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkoutTemplate _$WorkoutTemplateFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['name'],
  );
  return WorkoutTemplate(
    name: json['name'] as String,
    exercises: (json['exercises'] as List<dynamic>?)
            ?.map((e) => ExerciseTemplate.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
  )..lastPerformed = json['last_performed'] as int?;
}

Map<String, dynamic> _$WorkoutTemplateToJson(WorkoutTemplate instance) =>
    <String, dynamic>{
      'name': instance.name,
      'exercises': instance.exercises.map((e) => e.toJson()).toList(),
      'last_performed': instance.lastPerformed,
    };
