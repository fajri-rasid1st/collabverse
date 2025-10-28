// Dart imports:
import 'dart:convert';

// Package imports:
import 'package:http/http.dart' as http;

// Project imports:
import 'package:collabverse/core/const/const.dart';
import 'package:collabverse/src/data/models/wilayah_model.dart';

class WilayahApiService {
  // Singleton pattern
  static final WilayahApiService _instance = WilayahApiService._internal();

  WilayahApiService._internal();

  factory WilayahApiService() => _instance;

  // Http client
  http.Client? _client;
  http.Client get client => _client ??= http.Client();

  /// Mengambil data seluruh provinsi di Indonesia
  Future<List<WilayahModel>> getProvinces() async {
    final uri = Uri.parse('${Const.wilayahApiBaseUrl}/provinces.json');

    try {
      final response = await client.get(uri);

      if (response.statusCode == 200) {
        final results = jsonDecode(response.body);

        final List provinces = (results as Map<String, dynamic>)['data'];

        return provinces.map((e) => WilayahModel.fromMap(e)).toList();
      } else {
        throw Exception('error code: ${response.statusCode}');
      }
    } catch (e) {
      rethrow;
    }
  }

  /// Mengambil data seluruh kota/kabupaten berdasarkan [provinceCode]
  Future<List<WilayahModel>> getCities(String provinceCode) async {
    final uri = Uri.parse('${Const.wilayahApiBaseUrl}/regencies/$provinceCode.json');

    try {
      final response = await client.get(uri);

      if (response.statusCode == 200) {
        final results = jsonDecode(response.body);

        final List provinces = (results as Map<String, dynamic>)['data'];

        return provinces.map((e) => WilayahModel.fromMap(e)).toList();
      } else {
        throw Exception('error code: ${response.statusCode}');
      }
    } catch (e) {
      rethrow;
    }
  }
}
