import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../domain/entity/user_entity.dart';

part 'user_api_model.g.dart';

final userApiModelProvider = Provider<UserApiModel>(
  (ref) => UserApiModel.empty(),
);

@JsonSerializable()
class UserApiModel {
  @JsonKey(name: '_id')
  final String? id;
  final String fullname;
  final String? password;
  final String email;
  final String gender;
  final String nationality;
  final String dob;
  final String? languageMedium;
  final String? nativeLanguage;
  final String? learningLanguage;

  UserApiModel({
    this.password,
    this.id,
    required this.fullname,
    required this.email,
    required this.gender,
    required this.dob,
    this.languageMedium,
    this.nativeLanguage,
    required this.nationality,
    this.learningLanguage,
  });

  UserApiModel.empty()
      : id = '',
        fullname = '',
        password = '',
        email = '',
        gender = '',
        dob = '',
        languageMedium = '',
        nativeLanguage = '',
        nationality = '',
        learningLanguage = '';

  factory UserApiModel.fromJson(Map<String, dynamic> json) =>
      _$UserApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserApiModelToJson(this);

  // Convert Hive Object to Entity

  UserEntity toEntity() => UserEntity(
        id: id,
        fullname: fullname,
        password: password,
        email: email,
        gender: gender,
        dob: dob,
        languageMedium: languageMedium,
        nativeLanguage: nativeLanguage,
        nationality: nationality,
        learningLanguage: learningLanguage,
      );

  // UserHiveModel toHiveModel(UserEntity entity) => UserHiveModel(
  //       id: entity.id,
  //       username: entity.username!,
  //       password: entity.password,
  //       email: entity.email!,

  //     );

  // List<UserHiveModel> toHiveModelList(List<UserEntity> entities) =>
  //     entities.map((entity) => toHiveModel(entity)).toList();

  List<UserEntity> toEntityList(List<UserApiModel> models) =>
      models.map((model) => model.toEntity()).toList();

  UserEntity toUserEntity(UserApiModel model) => model.toEntity();

  @override
  String toString() {
    return 'UserApiModel(id: $id, fullname: $fullname, password: $password, email: $email , dob: $dob, languageMedium: $languageMedium, nativeLanguage: $nativeLanguage,gender: $gender , nationality: $nationality , learningLanguage: $learningLanguage)';
  }
}
