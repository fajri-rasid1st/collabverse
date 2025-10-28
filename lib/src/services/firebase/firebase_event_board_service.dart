// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';

// Project imports:
import 'package:collabverse/src/data/models/event_board_model.dart';

class FirebaseEventBoardService {
  // Singleton pattern
  static final FirebaseEventBoardService _instance = FirebaseEventBoardService._internal();
  FirebaseEventBoardService._internal();
  factory FirebaseEventBoardService() => _instance;

  // Firebase firestore
  FirebaseFirestore? _firebaseFirestore;
  FirebaseFirestore get firebaseFirestore => _firebaseFirestore ??= FirebaseFirestore.instance;

  /// Save event board
  Future<void> saveEventBoard(EventBoardModel eventBoard) async {
    try {
      final docRef = await firebaseFirestore.collection('event-board').add(eventBoard.toMap());

      await docRef.update({'uid': docRef.id});
    } catch (e) {
      rethrow;
    }
  }

  /// Update event board
  Future<void> updateEventBoard(EventBoardModel eventBoard) async {
    try {
      await firebaseFirestore.collection('event-board').doc(eventBoard.uid).update(eventBoard.toMap());
    } catch (e) {
      rethrow;
    }
  }

  /// Get all event boards
  Future<List<EventBoardModel>> getAllEventBoard() async {
    try {
      final snapshot = await firebaseFirestore.collection('event-board').get();

      return snapshot.docs.map((doc) => EventBoardModel.fromMap(doc.data())).toList();
    } catch (e) {
      rethrow;
    }
  }
}
