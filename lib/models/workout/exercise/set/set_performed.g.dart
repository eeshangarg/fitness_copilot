// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'set_performed.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SetPerformed _$SetPerformedFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['creation_date'],
  );
  return SetPerformed(
    weight: (json['weight'] as num?)?.toDouble() ?? 0.0,
    repsPerformed: json['reps_performed'] as int? ?? 0,
  )..creationDate = json['creation_date'] as int?;
}

Map<String, dynamic> _$SetPerformedToJson(SetPerformed instance) =>
    <String, dynamic>{
      'weight': instance.weight,
      'reps_performed': instance.repsPerformed,
      'creation_date': instance.creationDate,
    };
