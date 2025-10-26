// import 'package:flutter/material.dart';

class Data{
  final String uuid;
  final String title;
  final String desc;
  final String imageUrl;
  final String projectType;
  final String rolesNeeded;
  final num totalCreatorsNeeded;
  final num totalSaved;
  final String city;
  final String province;
  final String locationDetail;
  final double lat;
  final double lang;
  final DateTime deadline;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;

  Data({
    required this.uuid,
    required this.title,
    required this.desc,
    required this.imageUrl,
    required this.projectType,
    required this.rolesNeeded,
    required this.totalCreatorsNeeded,
    required this.totalSaved,
    required this.city,
    required this.province,
    required this.locationDetail,
    required this.lat,
    required this.lang,
    required this.deadline,
    required this.status,
    required this.createdAt,
    required this.updatedAt
  });

}

//  ProjectBrief
// Deskripsi: Proyek yang dibuat oleh creator untuk mencari creator lain sebagai partner kolaborasi.
// id (uuid)
// creatorId (uuid) → ref(UserProfile.id) → Relasi: UserProfile 1 ──< n ProjectBrief
// title (string)
// description (string?)
// imageUrl (string?)
// projectType (enum → “MUSIC”, “FILM”, “DANCE”, “...”)
// rolesNeeded (array<string>?)
// totalCreatorsNeeded (int)
// totalSaved (int)
// city (string)
// province (string)
// locationDetail (string?)
// lat (double?)
// lng (double?)
// deadline (datetime?)
// status (enum → “OPEN”, “CLOSED”)
// createdAt (datetime)
// updatedAt (datetime)


//  EventBoard
// Deskripsi: Event yang diunggah oleh organizer untuk mencari creator tertentu.
// id (uuid)
// organizerId (uuid) → ref(UserProfile.id) → Relasi: UserProfile 1 ──< n EventBoard
// name (string)
// description (string?)
// posterUrl (string?)
// eventType (enum → “MUSIC”, “FILM”, “DANCE”, “...”)
// rolesNeeded (array<string>?)
// totalCreatorsNeeded (int)
// totalSaved (int)
// venue (string)
// city (string)
// province (string)
// locationDetail (string?)
// lat (double?)
// lng (double?)
// dateStart (datetime)
// dateEnd (datetime?)
// deadline (datetime?)
// status (enum → “OPEN”, “CLOSED”, “EXPIRED”)
// createdAt (datetime)
// updatedAt (datetime)

//Bookmark
// id (uuid)
// userId (uuid) → ref(UserProfile.id) → Relasi: UserProfile 1 ──< n Bookmark
// postType (enum → “PROJECT_BRIEF”, “EVENT_BOARD”)
// postId (uuid) → ref(ProjectBrief.id atau EventBoard.id)
// createdAt (datetime)