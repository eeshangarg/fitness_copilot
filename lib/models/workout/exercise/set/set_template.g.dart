// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'set_template.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SetTemplate _$SetTemplateFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['creation_date'],
  );
  return SetTemplate(
    repGoal: json['rep_goal'] as int? ?? 0,
    weight: (json['weight'] as num?)?.toDouble() ?? 0.0,
  )
    ..lastPerformed = json['last_performed'] as int?
    ..creationDate = json['creation_date'] as int?;
}

Map<String, dynamic> _$SetTemplateToJson(SetTemplate instance) =>
    <String, dynamic>{
      'rep_goal': instance.repGoal,
      'weight': instance.weight,
      'last_performed': instance.lastPerformed,
      'creation_date': instance.creationDate,
    };
