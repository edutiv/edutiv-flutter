// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      id: json['id'] as int,
      avatar: json['avatar'] as String?,
      firstname: json['firstname'] as String?,
      lastname: json['lastname'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      role: json['role'] as String?,
      specialization: json['specialization'] as String?,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'avatar': instance.avatar,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'email': instance.email,
      'password': instance.password,
      'role': instance.role,
      'specialization': instance.specialization,
    };
