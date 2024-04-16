// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetUserInfoDTO _$GetUserInfoDTOFromJson(Map<String, dynamic> json) =>
    GetUserInfoDTO(
      data: UserApiModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetUserInfoDTOToJson(GetUserInfoDTO instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
