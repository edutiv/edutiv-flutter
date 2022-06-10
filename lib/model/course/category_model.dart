class CategoryModel {
  List<int>? courseId;
  int categoryId;
  String category;
  String? categoryIcon;
  String? description;

  CategoryModel({
    this.courseId,
    required this.categoryId,
    this.categoryIcon,
    required this.category,
    this.description,
  });
}
