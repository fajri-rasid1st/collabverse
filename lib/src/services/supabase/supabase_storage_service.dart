// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseStorageService {
  // Singleton pattern
  static final SupabaseStorageService _instance = SupabaseStorageService._internal();

  SupabaseStorageService._internal();

  factory SupabaseStorageService() => _instance;

  // Supabase storage client
  SupabaseStorageClient? _client;
  SupabaseStorageClient get client => _client ??= SupabaseStorageClient(
    url,
    headers,
  );

  /// Function untuk mengupload file gambar ke supabase storage
  /// ...
}
