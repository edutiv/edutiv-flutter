// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthModel _$AuthModelFromJson(Map<String, dynamic> json) => AuthModel(
      jti: json['jti'] as String?,
      sub: json['sub'] as String?,
    )..token = json['token'] as String?;

Map<String, dynamic> _$AuthModelToJson(AuthModel instance) => <String, dynamic>{
      'jti': instance.jti,
      'sub': instance.sub,
      'token': instance.token,
    };
