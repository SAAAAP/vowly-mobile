import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class AuthService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: kIsWeb ? 'http://localhost:5000' : 'http://10.0.2.2:5000',
      headers: {
        'Content-Type': 'application/json',
      },
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
    ),
  );

  Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _dio.post(
        '/api/auth/login',
        data: {
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        return response.data as Map<String, dynamic>;
      }

      throw Exception(
        response.data is Map && response.data['message'] != null
            ? response.data['message']
            : 'Login failed with status ${response.statusCode}',
      );
    } on DioException catch (e) {
      if (e.response != null) {
        final data = e.response?.data;
        throw Exception(
          data is Map && data['message'] != null
              ? data['message']
              : e.response?.statusMessage ?? 'Login failed',
        );
      }
      throw Exception(e.message);
    } catch (e) {
      throw Exception('Login failed: $e');
    }
  }

  Future<Map<String, dynamic>> register({
    required String name,
    required String email,
    required String password,
    String role = 'BRIDE',
  }) async {
    try {
      final response = await _dio.post(
        '/api/auth/register',
        data: {
          'name': name,
          'email': email,
          'password': password,
          'role': role,
        },
      );

      if (response.statusCode == 200) {
        return response.data as Map<String, dynamic>;
      }

      throw Exception(
        response.data is Map && response.data['message'] != null
            ? response.data['message']
            : 'Register failed with status ${response.statusCode}',
      );
    } on DioException catch (e) {
      if (e.response != null) {
        final data = e.response?.data;
        throw Exception(
          data is Map && data['message'] != null
              ? data['message']
              : e.response?.statusMessage ?? 'Register failed',
        );
      }
      throw Exception(e.message);
    } catch (e) {
      throw Exception('Register failed: $e');
    }
  }
}
