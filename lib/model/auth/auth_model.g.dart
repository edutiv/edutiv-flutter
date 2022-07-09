// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthModel _$AuthModelFromJson(Map<String, dynamic> json) => AuthModel(
      jti: json['jti'] as String?,
      sub: json['sub'] as String?,
    );

Map<String, dynamic> _$AuthModelToJson(AuthModel instance) => <String, dynamic>{
      'jti': instance.jti,
      'sub': instance.sub,
    };

TokenModel _$TokenModelFromJson(Map<String, dynamic> json) => TokenModel(
      token: json['token'] as String?,
    );

Map<String, dynamic> _$TokenModelToJson(TokenModel instance) =>
    <String, dynamic>{
      'token': instance.token,
    };
