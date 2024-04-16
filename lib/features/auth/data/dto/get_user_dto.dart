import 'package:json_annotation/json_annotation.dart';
import 'package:languageapp_frontend/features/auth/data/model/user_api_model.dart';

part 'get_user_dto.g.dart';

@JsonSerializable()
class GetUserInfoDTO {
  final UserApiModel data;

  GetUserInfoDTO({
    required this.data,
  });

  factory GetUserInfoDTO.fromJson(Map<String, dynamic> json) =>
      _$GetUserInfoDTOFromJson(json);

  Map<String, dynamic> toJson() => _$GetUserInfoDTOToJson(this);
}
