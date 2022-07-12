import 'package:json_annotation/json_annotation.dart';
part 'faq_model.g.dart';

@JsonSerializable()
class FAQModel {
  int? id;
  String? question;
  String? answer;
  bool? isExpanded;

  FAQModel({this.id, this.question, this.answer, this.isExpanded});

  factory FAQModel.fromJson(Map<String, dynamic> json) =>
      _$FAQModelFromJson(json);
  Map<String, dynamic> toJson() => _$FAQModelToJson(this);
}
