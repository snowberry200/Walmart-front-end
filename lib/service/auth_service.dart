import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:walmart/Model/Request/auth_request_dto.dart';
import 'package:walmart/Model/Response/auth_response_dto.dart';

class ApiService {
  static const String baseUrl = "http://localhost:8080/api/auth";
  final http.Client client;
  ApiService({http.Client? client}) : client = client ?? http.Client();

  //registration logic

  Future<AuthResponseDTO> signup(AuthRequestDTO authRequestDTO) async {
    try {
      final uri = Uri.parse('$baseUrl/register');
      final headers = {
        HttpHeaders.contentTypeHeader: 'application/json',
      };
      final body = jsonEncode(authRequestDTO.toJson());
      final response = await client.post(uri, headers: headers, body: body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final responseData = jsonDecode(response.body);

        return AuthResponseDTO.fromJson(responseData);
      } else if (response.statusCode == 400) {
        // Handle validation errors
        final errorData = jsonDecode(response.body);
        throw Exception('Registration failed: ${errorData['message']}');
      } else {
        throw Exception('Server error: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Signup error: $e');
    }
  }

  //login logic

  Future<AuthResponseDTO> signin(AuthRequestDTO authRequestDTO) async {
    try {
      final uri = Uri.parse('$baseUrl/login');
      final response = await client.post(uri,
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json',
          },
          body: jsonEncode(authRequestDTO.toJson()));
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        return AuthResponseDTO.fromJson(responseData);
      } else if (response.statusCode == 401) {
        throw Exception('Invalid email or password');
      } else {
        throw Exception('Login failed: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('log in error: $e');
    }
  }
}
