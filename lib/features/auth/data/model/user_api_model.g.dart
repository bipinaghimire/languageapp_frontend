// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserApiModel _$UserApiModelFromJson(Map<String, dynamic> json) => UserApiModel(
      password: json['password'] as String?,
      id: json['_id'] as String?,
      fullname: json['fullname'] as String,
      email: json['email'] as String,
      gender: json['gender'] as String,
      dob: json['dob'] as String,
      languageMedium: json['languageMedium'] as String?,
      nativeLanguage: json['nativeLanguage'] as String?,
      nationality: json['nationality'] as String,
      learningLanguage: json['learningLanguage'] as String?,
    );

Map<String, dynamic> _$UserApiModelToJson(UserApiModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'fullname': instance.fullname,
      'password': instance.password,
      'email': instance.email,
      'gender': instance.gender,
      'nationality': instance.nationality,
      'dob': instance.dob,
      'languageMedium': instance.languageMedium,
      'nativeLanguage': instance.nativeLanguage,
      'learningLanguage': instance.learningLanguage,
    };
