import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: "https://picsum.photos/v2/",
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    ),
  );

  Future<Response> fetchImages(int page, int limit) async {
    return await _dio.get(
      "list",
      queryParameters: {
        "page": page,
        "limit": limit,
      },
    );
  }
}
