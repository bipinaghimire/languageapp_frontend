class AuthResponseDto {
  final String token;
  final String message;

  AuthResponseDto({required this.token, required this.message});

  factory AuthResponseDto.fromJson(Map<String, dynamic> json) {
    return AuthResponseDto(
      token: json['token'],
      message: json['message'],
    );
  }
}
