import 'package:cloud_firestore/cloud_firestore.dart';

class EventBoardModel {
  final String? uid;
  final String? organizerUid;
  final String name;
  final String? description;
  final String? posterUrl;
  final String domain;
  final List<String> roles;
  final int totalNeeds;
  final String province;
  final String city;
  final String venue;
  final String? locationDetail;
  final double? lat;
  final double? long;
  final String status;
  final DateTime startDate;
  final DateTime deadline;

  const EventBoardModel({
    this.uid,
    this.organizerUid,
    required this.name,
    this.description,
    this.posterUrl,
    required this.domain,
    required this.roles,
    required this.totalNeeds,
    required this.province,
    required this.city,
    required this.venue,
    this.locationDetail,
    this.lat,
    this.long,
    required this.status,
    required this.startDate,
    required this.deadline,
  });

  factory EventBoardModel.fromMap(Map<String, dynamic> map) {
    return EventBoardModel(
      uid: map['uid'],
      organizerUid: map['organizerUid'],
      name: map['name'] ?? '',
      description: map['description'],
      posterUrl: map['posterUrl'],
      domain: map['domain'] ?? '',
      roles: List<String>.from(map['roles'] ?? []),
      totalNeeds: (map['totalNeeds'] as num?)?.toInt() ?? 0,
      province: map['province'] ?? '',
      city: map['city'] ?? '',
      venue: map['venue'] ?? '',
      locationDetail: map['locationDetail'],
      lat: (map['lat'] as num?)?.toDouble(),
      long: (map['long'] as num?)?.toDouble(),
      status: map['status'] ?? '',
      startDate: (map['startDate'] as Timestamp).toDate(),
      deadline: (map['deadline'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'organizerUid': organizerUid,
      'name': name,
      'description': description,
      'posterUrl': posterUrl,
      'domain': domain,
      'roles': roles,
      'totalNeeds': totalNeeds,
      'province': province,
      'city': city,
      'venue': venue,
      'locationDetail': locationDetail,
      'lat': lat,
      'long': long,
      'status': status,
      'startDate': Timestamp.fromDate(startDate),
      'deadline': Timestamp.fromDate(deadline),
    };
  }
}
