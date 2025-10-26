import 'package:collabverse/data/model/bookmark.dart';

final List<Bookmark> dummyBookmarkList = [
  Bookmark(
    id: 'bkmk-001',
    userId: 'user-001',
    postType: 'project',
    postId: '1a2b3c4d', // id dari Data dummy "Community Park Revamp"
    createdAt: DateTime(2025, 6, 15, 10, 30),
  ),
  Bookmark(
    id: 'bkmk-002',
    userId: 'user-001',
    postType: 'project',
    postId: '2b3c4d5e', // id dari Data dummy "Smart Waste Management App"
    createdAt: DateTime(2025, 7, 2, 14, 10),
  ),
  Bookmark(
    id: 'bkmk-003',
    userId: 'user-002',
    postType: 'project',
    postId: '4d5e6f7g', // id dari Data dummy "Coastal Cleanup Campaign"
    createdAt: DateTime(2025, 8, 9, 8, 45),
  ),
  Bookmark(
    id: 'bkmk-004',
    userId: 'user-001',
    postType: 'project',
    postId: '5e6f7g8h', // id dari Data dummy "Indigenous Culture Documentary"
    createdAt: DateTime(2025, 9, 1, 17, 20),
  ),
  Bookmark(
    id: 'bkmk-005',
    userId: 'user-003',
    postType: 'project',
    postId: '3c4d5e6f', // id dari Data dummy "Local Handicraft Marketplace"
    createdAt: DateTime(2025, 9, 10, 9, 5),
  ),
];