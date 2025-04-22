import 'dart:convert';
import 'package:hence_vendor_wanted/models/vendor_item.dart';
import 'package:hence_vendor_wanted/models/vendor_type_item.dart';
import 'package:http/http.dart' as http;

import '../models/api_response_item.dart';

class NetworkHelper {
  static const String baseUrl = 'http://127.0.0.1:8000/api/v1';

  static final NetworkHelper _instance = NetworkHelper._internal();
  factory NetworkHelper() => _instance;
  NetworkHelper._internal();

  static List<VendorTypeItem>? vendorTypes;

  static Future<List<VendorTypeItem>> getVendorTypes() async {
    if (vendorTypes != null) {
      return vendorTypes!;
    }
    
    try {
      final response = await http.get(
        Uri.parse('${NetworkHelper.baseUrl}/vendors/types'),
        headers: {'Accept-Charset': 'utf-8'},
      );
      
      if (response.statusCode == 200) {
        final String decodedBody = utf8.decode(response.bodyBytes);
        final Map<String, dynamic> jsonResponse = json.decode(decodedBody);
        
        final List<dynamic> vendorTypesJson = jsonResponse['data'];
        vendorTypes = vendorTypesJson.map((json) => VendorTypeItem.fromJson(json)).toList();
        return vendorTypes!;
      } else {
        throw Exception('Failed to load vendor types: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error getting vendor types: $e');
    }
  }
  
  static Future<ApiResponse<VendorListItem>> getVendorList(String? query, String? vendorType, String? sort) async {
    try {
      final queryParams = <String, String>{};
      if (query != null && query.isNotEmpty) queryParams['query'] = query;
      if (vendorType != null && vendorType.isNotEmpty) queryParams['type'] = vendorType;
      if (sort != null && sort.isNotEmpty) queryParams['sort'] = sort;
      
      final uri = Uri.parse('${NetworkHelper.baseUrl}/vendors').replace(queryParameters: queryParams);
      
      print("API 요청 URL: $uri");
      
      final response = await http.get(
        uri,
        headers: {'Accept-Charset': 'utf-8'},
      );
      
      print("API 응답 상태 코드: ${response.statusCode}");
      
      if (response.statusCode == 200) {
        final String decodedBody = utf8.decode(response.bodyBytes);
        print("API 응답 본문: $decodedBody");
        
        final Map<String, dynamic> jsonResponse = json.decode(decodedBody);
        
        return ApiResponse<VendorListItem>.fromJson(
          jsonResponse, 
          (data) => VendorListItem.fromJson(data)
        );
      } else {
        throw Exception('서버 오류: ${response.statusCode}');
      }
    } catch (e) {
      print("API 요청 실패: $e");
      throw Exception('벤더 목록 불러오기 실패: $e');
    }
  }
  
}