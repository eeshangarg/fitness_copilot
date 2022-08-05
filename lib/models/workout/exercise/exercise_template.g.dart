// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise_template.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExerciseTemplate _$ExerciseTemplateFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['name', 'body_part'],
  );
  return ExerciseTemplate(
    name: json['name'] as String,
    bodyPart: json['body_part'] as String,
    sets: (json['sets'] as List<dynamic>?)
            ?.map((e) => ExerciseSet.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
  );
}

Map<String, dynamic> _$ExerciseTemplateToJson(ExerciseTemplate instance) =>
    <String, dynamic>{
      'name': instance.name,
      'body_part': instance.bodyPart,
      'sets': instance.sets.map((e) => e.toJson()).toList(),
    };
