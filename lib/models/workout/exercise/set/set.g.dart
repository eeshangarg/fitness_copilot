// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'set.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Set _$SetFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['creation_date'],
  );
  return Set(
    weight: (json['weight'] as num?)?.toDouble() ?? 0.0,
    repsPerformed: json['reps_performed'] as int? ?? 0,
  )..creationDate = json['creation_date'] as int?;
}

Map<String, dynamic> _$SetToJson(Set instance) => <String, dynamic>{
      'weight': instance.weight,
      'reps_performed': instance.repsPerformed,
      'creation_date': instance.creationDate,
    };
