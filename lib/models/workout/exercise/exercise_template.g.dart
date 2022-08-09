// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise_template.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExerciseTemplate _$ExerciseTemplateFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['name', 'body_part', 'creation_date'],
  );
  return ExerciseTemplate(
    name: json['name'] as String,
    bodyPart: json['body_part'] as String,
    sets: (json['sets'] as List<dynamic>?)
            ?.map((e) => SetTemplate.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
  )
    ..lastPerformed = json['last_performed'] as int?
    ..creationDate = json['creation_date'] as int?;
}

Map<String, dynamic> _$ExerciseTemplateToJson(ExerciseTemplate instance) =>
    <String, dynamic>{
      'name': instance.name,
      'body_part': instance.bodyPart,
      'sets': instance.sets.map((e) => e.toJson()).toList(),
      'last_performed': instance.lastPerformed,
      'creation_date': instance.creationDate,
    };
