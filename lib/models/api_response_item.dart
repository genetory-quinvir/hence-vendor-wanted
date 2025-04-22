// lib/models/api_response.dart
class ApiResponse<T> {
  final int code;
  final String message;
  final T data;
  
  ApiResponse({
    required this.code,
    required this.message,
    required this.data,
  });
  
  factory ApiResponse.fromJson(Map<String, dynamic> json, T Function(dynamic) fromJsonT) {
    return ApiResponse(
      code: json['code'] ?? 0,
      message: json['message'] ?? '',
      data: fromJsonT(json['data']),
    );
  }
}