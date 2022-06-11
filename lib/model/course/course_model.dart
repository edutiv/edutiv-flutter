class CourseModel {
  int id;
  int? categoryId;
  String? courseName;
  String? courseImage;
  String? mentorName;
  String? description;
  String? totalTime;
  int? totalVideo;
  int? rating;
  List<Section>? section;
  List<Tools>? tools;
  List<Review>? reviews;

  CourseModel({
    required this.id,
    this.categoryId,
    this.courseName,
    this.courseImage,
    this.mentorName,
    this.description,
    this.rating,
    this.totalVideo,
    this.totalTime,
    this.section,
    this.tools,
    this.reviews,
  });
}

class Tools {
  int id;
  int courseId;
  String? toolsName;
  String? toolsIcon;
  String? url;

  Tools({
    required this.id,
    required this.courseId,
    this.toolsName,
    this.toolsIcon,
    this.url,
  });
}

class Section {
  int id;
  String? sectionName;
  List<Material>? material;

  Section({
    required this.id,
    this.sectionName,
    this.material,
  });
}

class Material {
  int id;
  int lessonId;
  String? materialType;
  String? url;
  bool? isCompleted;

  Material({
    required this.id,
    required this.lessonId,
    this.materialType,
    this.url,
    this.isCompleted,
  });
}

class Review {
  int id;
  int userId;
  int courseId;
  int? rating;
  String? review;

  Review({
    required this.id,
    required this.userId,
    required this.courseId,
    this.rating,
    this.review,
  });
}
