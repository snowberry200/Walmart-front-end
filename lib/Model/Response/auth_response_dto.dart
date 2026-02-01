import 'package:walmart/Model/Response/user_dto.dart';

class AuthResponseDTO {
  final UserDTO user;
  final String accessToken;
  final String message;
  final bool isActive;
  final bool requiresVerification;
  final String verificationToken;

  AuthResponseDTO({
    required this.user,
    required this.accessToken,
    required this.message,
    required this.requiresVerification,
    required this.isActive,
    required this.verificationToken,
  });
//signin (Normal login)
  factory AuthResponseDTO.forSignIn(
      UserDTO user, String accessToken, String message, bool isActive) {
    AuthResponseDTO authResponseDTO = AuthResponseDTO(
      user: user,
      accessToken: accessToken,
      message: message,
      requiresVerification: false,
      verificationToken: '',
      isActive: isActive,
    );
    return authResponseDTO;
  }

//registration (Auto-login with verification token)
  factory AuthResponseDTO.forSignUp(String message, String verificationToken,
      UserDTO user, String accessToken, bool isActive) {
    AuthResponseDTO authResponseDTO = AuthResponseDTO(
      user: user,
      accessToken: accessToken,
      message: message,
      requiresVerification: true,
      verificationToken: verificationToken,
      isActive: isActive,
    );
    return authResponseDTO;
  }

  factory AuthResponseDTO.fromJson(Map<String, dynamic> json) {
    return AuthResponseDTO(
      user: UserDTO.fromJson(json['user']),
      accessToken: json['accessToken'],
      message: json['message'],
      requiresVerification: json['requiresVerification'] ?? false,
      verificationToken: json['verificationToken'] ?? '',
      isActive: json['isActive'] ?? false,
    );
  }

  // Method for TO JSON (serialization)
  Map<String, dynamic> toJson() {
    return {
      'user': user.toJson(),
      'accessToken': accessToken,
      'message': message,
      'requiresVerification': requiresVerification,
      'verificationToken': verificationToken,
    };
  }
}
