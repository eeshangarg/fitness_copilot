// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'set.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Set _$SetFromJson(Map<String, dynamic> json) => Set(
      weight: (json['weight'] as num?)?.toDouble() ?? 0.0,
      repsPerformed: json['reps_performed'] as int? ?? 0,
    );

Map<String, dynamic> _$SetToJson(Set instance) => <String, dynamic>{
      'weight': instance.weight,
      'reps_performed': instance.repsPerformed,
    };
