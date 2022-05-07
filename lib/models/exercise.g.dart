// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Exercise _$ExerciseFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['name', 'body_part'],
  );
  return Exercise(
    name: json['name'] as String,
    bodyPart: json['body_part'] as String,
    sets: (json['sets'] as List<dynamic>?)
            ?.map((e) => ExerciseSet.fromJson(e as Map<String, dynamic>))
            .toList() ??
        const [],
  );
}

Map<String, dynamic> _$ExerciseToJson(Exercise instance) => <String, dynamic>{
      'name': instance.name,
      'body_part': instance.bodyPart,
      'sets': instance.sets.map((e) => e.toJson()).toList(),
    };
