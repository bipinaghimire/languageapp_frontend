// users entity
import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String? id;
  final String email;
  final String fullname;
  final String? password;
  final String gender;
  final String dob;
  final String? languageMedium;
  final String? nativeLanguage;
  final String nationality;
  final String? learningLanguage;

  const UserEntity(
      {required this.email,
      required this.fullname,
      this.password,
      this.id,
      required this.dob,
      required this.gender,
      this.languageMedium,
      this.nativeLanguage,
      required this.nationality,
      this.learningLanguage});

  @override
  List<Object?> get props => [
        email,
        fullname,
        password,
        dob,
        gender,
        languageMedium,
        nativeLanguage,
        nationality,
        learningLanguage
      ];
}
