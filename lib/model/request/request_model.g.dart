// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestModel _$RequestModelFromJson(Map<String, dynamic> json) => RequestModel(
      userId: json['id'] as int?,
      title: json['title'] as String?,
      categoryId: json['category_id'] as int?,
      requestType: json['request_type'] as String?,
    );

Map<String, dynamic> _$RequestModelToJson(RequestModel instance) =>
    <String, dynamic>{
      'id': instance.userId,
      'title': instance.title,
      'category_id': instance.categoryId,
      'request_type': instance.requestType,
    };
