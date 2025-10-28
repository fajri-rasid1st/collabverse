// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';

// Project imports:
import 'package:collabverse/src/data/models/user_model.dart';

class FirebaseUserService {
  // Singleton pattern
  static final FirebaseUserService _instance = FirebaseUserService._internal();

  FirebaseUserService._internal();

  factory FirebaseUserService() => _instance;

  // Firebase firestore
  FirebaseFirestore? _firebaseFirestore;
  FirebaseFirestore get firebaseFirestore => _firebaseFirestore ??= FirebaseFirestore.instance;

  /// Save user to firestore database
  Future<void> saveUser(UserModel user) async {
    try {
      await firebaseFirestore.collection('users').doc(user.uid).set(user.toMap());
    } catch (e) {
      rethrow;
    }
  }

  /// Get user from firestore database
  Future<UserModel?> getUser(String uid) async {
    try {
      final doc = await firebaseFirestore.collection('users').doc(uid).get();

      if (doc.exists) {
        return UserModel.fromMap(doc.data()!);
      }

      return null;
    } catch (e) {
      rethrow;
    }
  }
}
