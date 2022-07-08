// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Review _$ReviewFromJson(Map<String, dynamic> json) => Review(
      id: json['id'] as int,
      user: json['user'] == null
          ? null
          : UserModel.fromJson(json['user'] as Map<String, dynamic>),
      course: json['course'] == null
          ? null
          : CourseModel.fromJson(json['course'] as Map<String, dynamic>),
      rating: json['rating'] as int?,
      review: json['review'] as String?,
    );

Map<String, dynamic> _$ReviewToJson(Review instance) => <String, dynamic>{
      'id': instance.id,
      'rating': instance.rating,
      'review': instance.review,
      'user': instance.user,
      'course': instance.course,
    };
