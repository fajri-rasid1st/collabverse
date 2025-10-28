// Package imports:
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  // Singleton pattern
  static final FirebaseAuthService _instance = FirebaseAuthService._internal();

  FirebaseAuthService._internal();

  factory FirebaseAuthService() => _instance;

  // Firebase auth
  FirebaseAuth? _firebaseAuth;
  FirebaseAuth get firebaseAuth => _firebaseAuth ??= FirebaseAuth.instance;

  /// Sign in
  ///
  /// Return uid of the user signed in.
  Future<String?> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return credential.user?.uid;
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(
        code: e.code,
        message: e.message,
      );
    }
  }

  /// Sign up
  ///
  /// Return true if sign up success.
  Future<bool> signUp({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      return credential.user != null;
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(
        code: e.code,
        message: e.message,
      );
    }
  }

  /// Sign out
  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }

  /// Auth state changes
  Stream<User?> authStateChanges() {
    return firebaseAuth.authStateChanges();
  }
}
