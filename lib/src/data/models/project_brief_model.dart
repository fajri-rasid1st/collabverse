import 'package:cloud_firestore/cloud_firestore.dart';

class ProjectBriefModel {
  final String? uid;
  final String? creatorUid;
  final String title;
  final String? description;
  final String? imageUrl;
  final String domain;
  final List<String> roles;
  final int totalNeeds;
  final String province;
  final String city;
  final String? locationDetail;
  final double? lat;
  final double? long;
  final String status;
  final DateTime deadline;

  const ProjectBriefModel({
    this.uid,
    this.creatorUid,
    required this.title,
    this.description,
    this.imageUrl,
    required this.domain,
    required this.roles,
    required this.totalNeeds,
    required this.province,
    required this.city,
    this.locationDetail,
    this.lat,
    this.long,
    required this.status,
    required this.deadline,
  });

  factory ProjectBriefModel.fromMap(Map<String, dynamic> map) {
    return ProjectBriefModel(
      uid: map['uid'],
      creatorUid: map['creatorUid'],
      title: map['title'] ?? '',
      description: map['description'],
      imageUrl: map['imageUrl'],
      domain: map['domain'] ?? '',
      roles: List<String>.from(map['roles'] ?? []),
      totalNeeds: (map['totalNeeds'] as num?)?.toInt() ?? 0,
      province: map['province'] ?? '',
      city: map['city'] ?? '',
      locationDetail: map['locationDetail'],
      lat: (map['lat'] as num?)?.toDouble(),
      long: (map['long'] as num?)?.toDouble(),
      status: map['status'] ?? '',
      deadline: (map['deadline'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'creatorUid': creatorUid,
      'title': title,
      'description': description,
      'imageUrl': imageUrl,
      'domain': domain,
      'roles': roles,
      'totalNeeds': totalNeeds,
      'province': province,
      'city': city,
      'locationDetail': locationDetail,
      'lat': lat,
      'long': long,
      'status': status,
      'deadline': Timestamp.fromDate(deadline),
    };
  }
}
