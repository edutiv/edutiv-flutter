import 'package:json_annotation/json_annotation.dart';
part 'request_model.g.dart';

@JsonSerializable()
class RequestModel {
  @JsonKey(name: 'user_id')
  int? userId;
  String? title;
  @JsonKey(name: 'category_id')
  int? categoryId;
  @JsonKey(name: 'request_type')
  String? requestType;

  RequestModel({this.userId, this.title, this.categoryId, this.requestType});

  factory RequestModel.fromJson(Map<String, dynamic> json) =>
      _$RequestModelFromJson(json);
  Map<String, dynamic> toJson() => _$RequestModelToJson(this);
}
