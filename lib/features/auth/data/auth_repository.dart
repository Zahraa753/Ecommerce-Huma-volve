import 'dart:convert';

import 'package:dio/dio.dart';

import '../../../core/constants/api_constants.dart';
import '../../../core/network/dio_client.dart';
import '../../../core/services/auth_storage_service.dart';
import 'models/auth_tokens.dart';
import 'models/user_model.dart';

class AuthRepository {
  AuthRepository({
    Dio? dio,
    AuthStorageService? storage,
  })  : _dio = dio ?? DioClient.instance,
        _storage = storage ?? AuthStorageService();

  final Dio _dio;
  final AuthStorageService _storage;

  Future<AuthTokens> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        '/auth${ApiConstants.loginPath}',
        data: {
          'email': email.trim(),
          'password': password,
        },
      );

      final tokens = AuthTokens.fromJson(response.data!);
      await _storage.saveTokens(
        accessToken: tokens.accessToken,
        refreshToken: tokens.refreshToken,
      );
      return tokens;
    } on DioException catch (e) {
      throw AuthException(_messageFromDio(e));
    }
  }

  Future<UserModel> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        ApiConstants.usersPath,
        data: {
          'name': name.trim(),
          'email': email.trim(),
          'password': password,
          'avatar': 'https://picsum.photos/seed/${email.hashCode}/200',
        },
      );

      return UserModel.fromJson(response.data!);
    } on DioException catch (e) {
      throw AuthException(_messageFromDio(e));
    }
  }

  Future<void> logout() => _storage.clearSession();

  Future<bool> isLoggedIn() => _storage.hasSession();

  String _messageFromDio(DioException error) {
    final data = error.response?.data;
    if (data is Map<String, dynamic>) {
      final message = data['message'];
      if (message is String && message.isNotEmpty) {
        return message;
      }
    }
    if (data is String) {
      try {
        final decoded = jsonDecode(data) as Map<String, dynamic>;
        final message = decoded['message'];
        if (message is String && message.isNotEmpty) {
          return message;
        }
      } catch (_) {}
    }

    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.sendTimeout:
        return 'Connection timed out. Please try again.';
      case DioExceptionType.connectionError:
        return 'No internet connection. Check your network and try again.';
      default:
        return 'Something went wrong. Please try again.';
    }
  }
}

class AuthException implements Exception {
  AuthException(this.message);

  final String message;

  @override
  String toString() => message;
}
