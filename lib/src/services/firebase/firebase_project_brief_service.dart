// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';

// Project imports:
import 'package:collabverse/src/data/models/project_brief_model.dart';

class FirebaseProjectBriefService {
  // Singleton pattern
  static final FirebaseProjectBriefService _instance = FirebaseProjectBriefService._internal();
  FirebaseProjectBriefService._internal();
  factory FirebaseProjectBriefService() => _instance;

  // Firebase firestore
  FirebaseFirestore? _firebaseFirestore;
  FirebaseFirestore get firebaseFirestore => _firebaseFirestore ??= FirebaseFirestore.instance;

  /// Save project brief
  Future<void> saveProjectBrief(ProjectBriefModel projectBrief) async {
    try {
      final docRef = await firebaseFirestore.collection('project-brief').add(projectBrief.toMap());

      await docRef.update({'uid': docRef.id});
    } catch (e) {
      rethrow;
    }
  }

  /// Update project brief
  Future<void> updateProjectBrief(ProjectBriefModel projectBrief) async {
    try {
      await firebaseFirestore.collection('project-brief').doc(projectBrief.uid).update(projectBrief.toMap());
    } catch (e) {
      rethrow;
    }
  }

  /// Get all project briefs
  Future<List<ProjectBriefModel>> getAllProjectBrief() async {
    try {
      final snapshot = await firebaseFirestore.collection('project-brief').get();

      return snapshot.docs.map((doc) => ProjectBriefModel.fromMap(doc.data())).toList();
    } catch (e) {
      rethrow;
    }
  }
}
