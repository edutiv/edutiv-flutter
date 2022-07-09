import 'package:json_annotation/json_annotation.dart';
part 'auth_model.g.dart';

@JsonSerializable()
class AuthModel {
  String? jti;
  String? sub;

  AuthModel({this.jti, this.sub});

  factory AuthModel.fromJson(Map<String, dynamic> json) =>
      _$AuthModelFromJson(json);
  Map<String, dynamic> toJson() => _$AuthModelToJson(this);
}

@JsonSerializable()
class TokenModel {
  String? token;
  TokenModel({this.token});
  factory TokenModel.fromJson(Map<String, dynamic> json) =>
      _$TokenModelFromJson(json);
  Map<String, dynamic> toJson() => _$TokenModelToJson(this);
}
