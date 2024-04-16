import 'package:flutter_riverpod/flutter_riverpod.dart';
// ignore: depend_on_referenced_packages
import 'package:hive/hive.dart';
import 'package:languageapp_frontend/config/constants/hive_table_constant.dart';
import 'package:languageapp_frontend/features/auth/domain/entity/user_entity.dart';

part 'user_hive_model.g.dart';

final authHiveModelProvider = Provider(
  (ref) => UserHiveModel.empty(),
);

//user model for the application
@HiveType(typeId: HiveTableConstant.userTableId)
class UserHiveModel {
  @HiveField(0)
  final String email;
  @HiveField(1)
  final String fullname;
  @HiveField(2)
  final String password;
  @HiveField(3)
  final String gender;
  @HiveField(4)
  final String dob;
  @HiveField(5)
  final String languageMedium;
  @HiveField(6)
  final String nativeLanguage;
  @HiveField(7)
  final String nationality;
  @HiveField(8)
  final String? learningLanguage;

  //empty contructor
  UserHiveModel.empty()
      : this(
          email: "",
          fullname: "",
          password: "",
          gender: "",
          dob: "",
          languageMedium: "",
          nativeLanguage: "",
          nationality: "",
          learningLanguage: "",
        );

  UserHiveModel(
      {required this.email,
      required this.fullname,
      required this.password,
      required this.dob,
      required this.gender,
      required this.languageMedium,
      required this.nativeLanguage,
      required this.nationality,
      this.learningLanguage});

  @override
  String toString() =>
      'UserEntity(email: $email, username: $fullname, password:$password ,dob: $dob, )';

  //convert hive object to entity
  UserEntity toEntity() => UserEntity(
        email: email,
        fullname: fullname,
        password: password,
        dob: dob,
        gender: gender,
        languageMedium: languageMedium,
        nativeLanguage: nativeLanguage,
        nationality: nationality,
        learningLanguage: learningLanguage,
      );

  // convert entity into hive object
  UserHiveModel toHiveModel(UserEntity entity) => UserHiveModel(
        email: entity.email,
        fullname: entity.fullname,
        password: entity.password!,
        dob: entity.dob,
        gender: entity.gender,
        languageMedium: '',
        nativeLanguage: '',
        nationality: entity.nationality,
        learningLanguage: entity.learningLanguage,
      );

  // convert hive list to entity list
  List<UserEntity> toEntityList(List<UserHiveModel> hiveList) =>
      hiveList.map((e) => e.toEntity()).toList();
}
