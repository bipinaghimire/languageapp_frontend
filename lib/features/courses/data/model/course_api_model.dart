import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:languageapp_frontend/features/courses/domain/entity/course_entity.dart';

part 'course_api_model.g.dart';

final courseApiModelProvider = Provider<CourseApiModel>(
  (ref) => CourseApiModel.empty(),
);

@JsonSerializable()
class CourseApiModel {
  @JsonKey(name: '_id')
  final String? id;
  final String title;

  CourseApiModel({this.id, required this.title});

  CourseApiModel.empty()
      : id = '',
        title = '';

  // factory CourseApiModel.fromJson(Map<String, dynamic> json) =>
  //     _$CourseApiModelFromJson(json);

  // Map<String, dynamic> toJson() => _$CourseApiModelToJson(this);

  // Convert Hive Object to Entity
  CourseEntity toEntity() => CourseEntity(
        id: id,
        title: title,
      );

  List<CourseEntity> toEntityList(List<CourseApiModel> models) =>
      models.map((model) => model.toEntity()).toList();

  CourseEntity toUserEntity(CourseApiModel model) => model.toEntity();

  @override
  String toString() {
    return 'CourseApiModel{id: $id, title: $title}';
  }
}
