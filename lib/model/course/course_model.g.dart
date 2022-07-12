// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseModel _$CourseModelFromJson(Map<String, dynamic> json) => CourseModel(
      id: json['id'] as int?,
      courseName: json['course_name'] as String?,
      courseImage: json['course_image'] as String?,
      category: json['category'] == null
          ? null
          : CategoryModel.fromJson(json['category'] as Map<String, dynamic>),
      description: json['description'] as String?,
      totalVideo: json['total_video'] as int?,
      totalTime: json['total_times'] as String?,
      totalRating: (json['total_rating'] as num?)?.toDouble(),
      sections: (json['sections'] as List<dynamic>?)
          ?.map((e) => Section.fromJson(e as Map<String, dynamic>))
          .toList(),
      reviews: (json['reviews'] as List<dynamic>?)
          ?.map((e) => Review.fromJson(e as Map<String, dynamic>))
          .toList(),
      tools: (json['tools'] as List<dynamic>?)
          ?.map((e) => Tools.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CourseModelToJson(CourseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'course_name': instance.courseName,
      'course_image': instance.courseImage,
      'category': instance.category,
      'description': instance.description,
      'total_video': instance.totalVideo,
      'total_times': instance.totalTime,
      'total_rating': instance.totalRating,
      'sections': instance.sections,
      'reviews': instance.reviews,
      'tools': instance.tools,
    };
