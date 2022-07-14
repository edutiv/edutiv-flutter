// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enrolled_course_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EnrolledCourseModel _$EnrolledCourseModelFromJson(Map<String, dynamic> json) =>
    EnrolledCourseModel(
      id: json['id'] as int?,
      rating: (json['rating'] as num?)?.toDouble(),
      progress: (json['progress'] as num?)?.toDouble(),
      review: json['review'] as String?,
      user: json['user'] == null
          ? null
          : UserModel.fromJson(json['user'] as Map<String, dynamic>),
      course: json['course'] == null
          ? null
          : CourseModel.fromJson(json['course'] as Map<String, dynamic>),
      reports: (json['reports'] as List<dynamic>?)
          ?.map((e) => ReportsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$EnrolledCourseModelToJson(
        EnrolledCourseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'rating': instance.rating,
      'progress': instance.progress,
      'review': instance.review,
      'user': instance.user,
      'course': instance.course,
      'reports': instance.reports,
    };
