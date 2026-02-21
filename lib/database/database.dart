import 'dart:async';
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:walmart/Model/Request/auth_request_dto.dart';
import 'package:walmart/Model/Response/auth_response_dto.dart';
import 'package:walmart/service/auth_service.dart';

class Database {
  final ApiService apiService;
  final firestore = FirebaseFirestore.instance;

  Database() : apiService = ApiService(client: null);

  //for firebase

  Future<Map<String, dynamic>> login(
      {required String username, required String pass}) async {
    try {
      // Query to find user with matching email and password
      final querySnapshot = await firestore
          .collection('credential')
          .where('user', isEqualTo: username)
          .where('password', isEqualTo: pass)
          .limit(1)
          .get();

      if (querySnapshot.docs.isEmpty) {
        throw Exception('Invalid email or password');
      }

      // Return user data
      final userData = querySnapshot.docs.first.data();
      log('User found: $userData');
      return userData;
    } catch (e) {
      log('getInfo error: $e');
      rethrow; // IMPORTANT: rethrow so Bloc can catch the error
    }
  }

  // This should be for SIGN UP - creating new user
  Future<void> register({
    required String name,
    required String username,
    required String password,
  }) async {
    try {
      // First check if user already exists
      final existingUser = await firestore
          .collection('credential')
          .where('user', isEqualTo: username)
          .limit(1)
          .get();

      if (existingUser.docs.isNotEmpty) {
        throw Exception('User with this email already exists');
      }

      // Create new user
      final data = {
        'name': name,
        'user': username,
        'password': password,
        'createdAt': FieldValue.serverTimestamp(),
      };

      // Add to Firestore and wait for completion
      await firestore.collection('credential').add(data);

      log('User created successfully: $username');
    } catch (e) {
      log('signUp error: $e');
      rethrow; // IMPORTANT: rethrow so Bloc can catch the error
    }
  }

  //for javaSpringBoot

  Future<AuthResponseDTO> signin({
    required String email,
    required String password,
  }) async {
    return await apiService
        .signin(AuthRequestDTO.forSignIn(email, password, true));
  }

  Future<AuthResponseDTO> signup({
    required String name,
    required String email,
    required String password,
  }) async {
    return await apiService
        .signup(AuthRequestDTO.forSignUp(name, email, password, true));
  }
}
