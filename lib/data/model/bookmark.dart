class Bookmark{
  final String id;
  final String userId;
  final String postType;
  final String postId;
  final DateTime createdAt;

  Bookmark({
    required this.id,
    required this.userId,
    required this.postType,
    required this.postId,
    required this.createdAt
  });  
}

//Bookmark
// id (uuid)
// userId (uuid) → ref(UserProfile.id) → Relasi: UserProfile 1 ──< n Bookmark
// postType (enum → “PROJECT_BRIEF”, “EVENT_BOARD”)
// postId (uuid) → ref(ProjectBrief.id atau EventBoard.id)
// createdAt (datetime)