// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      id: json['id'] as int?,
      specializationId: json['specialization_id'] as int?,
      avatar: json['profile_image'] as String?,
      firstname: json['firstname'] as String?,
      lastname: json['lastname'] as String?,
      email: json['username'] as String?,
      password: json['password'] as String?,
      role: json['role'] as String?,
      specialization: json['category'] == null
          ? null
          : CategoryModel.fromJson(json['category'] as Map<String, dynamic>),
    )..enrolledCourse = (json['enrolled_course'] as List<dynamic>?)
        ?.map((e) => CourseModel.fromJson(e as Map<String, dynamic>))
        .toList();

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'specialization_id': instance.specializationId,
      'profile_image': instance.avatar,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'username': instance.email,
      'password': instance.password,
      'role': instance.role,
      'category': instance.specialization,
      'enrolled_course': instance.enrolledCourse,
    };
