// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'set_template.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SetTemplate _$SetTemplateFromJson(Map<String, dynamic> json) => SetTemplate(
      repGoal: json['rep_goal'] as int? ?? 0,
      weight: (json['weight'] as num?)?.toDouble() ?? 0.0,
      repsPerformed: json['reps_performed'] as int? ?? 0,
    );

Map<String, dynamic> _$SetTemplateToJson(SetTemplate instance) =>
    <String, dynamic>{
      'rep_goal': instance.repGoal,
      'weight': instance.weight,
      'reps_performed': instance.repsPerformed,
    };
