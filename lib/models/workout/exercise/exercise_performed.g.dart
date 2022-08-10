// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise_performed.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExercisePerformed _$ExercisePerformedFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['name', 'body_part', 'creation_date'],
  );
  return ExercisePerformed(
    name: json['name'] as String,
    bodyPart: json['body_part'] as String,
    sets: (json['sets'] as List<dynamic>?)
            ?.map((e) => SetPerformed.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
  )..creationDate = json['creation_date'] as int?;
}

Map<String, dynamic> _$ExercisePerformedToJson(ExercisePerformed instance) =>
    <String, dynamic>{
      'name': instance.name,
      'body_part': instance.bodyPart,
      'sets': instance.sets.map((e) => e.toJson()).toList(),
      'creation_date': instance.creationDate,
    };
