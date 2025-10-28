// Dart imports:
import 'dart:io';

// Package imports:
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseStorageService {
  // Singleton pattern
  static final SupabaseStorageService _instance = SupabaseStorageService._internal();
  SupabaseStorageService._internal();
  factory SupabaseStorageService() => _instance;

  // Supabase storage client
  SupabaseStorageClient? _storage;
  SupabaseStorageClient get storage => _storage ??= Supabase.instance.client.storage;

  /// Upload file ke storage
  Future<String> upload({
    required String path,
    required File file,
  }) async {
    return await storage.from('cv_bucket').upload(path, file);
  }

  /// Hapus file dari storage
  Future<void> delete(String path) async {
    await storage.from('cv_bucket').remove([path]);
  }

  /// Dapatkan public url untuk path di bucket
  String getPublicUrl(String path) {
    return storage.from('cv_bucket').getPublicUrl(path);
  }

  /// Util untuk membuat path di dalam folder "images"
  String buildImagePath(
    String fileName, {
    String? uid,
  }) {
    final base = 'images';

    return (uid == null || uid.isEmpty) ? '$base/$fileName' : '$base/$uid/$fileName';
  }
}
