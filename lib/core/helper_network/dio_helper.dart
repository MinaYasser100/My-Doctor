import 'package:dio/dio.dart';
import 'app_const.dart';

class DioHelper {
  static final DioHelper _instance = DioHelper._internal();
  late final Dio _dio;

  DioHelper._internal() {
    _dio = Dio(
      BaseOptions(
        baseUrl: AppConst.baseUrl,
        headers: {'Content-Type': 'application/json'},
        receiveDataWhenStatusError: true,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
      ),
    );
  }

  factory DioHelper() => _instance;

  Dio get dio => _dio;

  // Unified GET request for all DailyMed API endpoints
  Future<Response> getData({
    required String endpoint,
    String? setId,
    Map<String, dynamic>? query,
  }) async {
    try {
      // Construct the URL based on endpoint and setId
      String url = endpoint;
      if (setId != null && endpoint == AppConst.spl) {
        url = '$endpoint/$setId';
      }
      final response = await _dio.get(url, queryParameters: query);
      return response;
    } on DioException catch (e) {
      throw _handleDioError(e);
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }

  // Generic POST request (retained for future use)
  Future<Response> postData({
    required String url,
    required Map<String, dynamic>? data,
  }) async {
    try {
      final response = await _dio.post(url, data: data);
      return response;
    } on DioException catch (e) {
      throw _handleDioError(e);
    } catch (e) {
      throw Exception('Failed to post data: $e');
    }
  }

  // Handle Dio errors
  Exception _handleDioError(DioException e) {
    if (e.response != null) {
      return Exception(
        'API Error: ${e.response?.statusCode} - ${e.response?.data['message'] ?? e.message}',
      );
    } else if (e.type == DioExceptionType.connectionTimeout) {
      return Exception(
        'Connection timeout. Please check your internet connection.',
      );
    } else if (e.type == DioExceptionType.receiveTimeout) {
      return Exception('Response timeout. Please try again later.');
    } else {
      return Exception('Network error: ${e.message}');
    }
  }
}
