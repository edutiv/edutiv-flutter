class CourseModel {
  int id;
  int? categoryId;
  String courseName;
  String courseImage;
  String mentorName;
  String? description;
  String totalTime;
  int totalVideo;
  int rating;
  // List<Lesson> lesson;
  // List<Tools> tools;
  // List<ReviewsModel> reviews;

  CourseModel({
    required this.id,
    this.categoryId,
    required this.courseName,
    required this.courseImage,
    required this.mentorName,
    this.description,
    required this.rating,
    required this.totalVideo,
    required this.totalTime,
  });
}
