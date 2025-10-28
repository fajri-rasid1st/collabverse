class UserModel {
  final String? uid;
  final String userType;
  final String fullName;
  final String email;
  final String phoneNumber;
  final String? instagramUsername;
  final String? profilePictureUrl;
  final String province;
  final String city;
  final String? bio;
  final String domain;
  final List<String> roles;
  final double? lat;
  final double? long;

  const UserModel({
    this.uid,
    required this.userType,
    required this.fullName,
    required this.email,
    required this.phoneNumber,
    this.instagramUsername,
    this.profilePictureUrl,
    required this.province,
    required this.city,
    this.bio,
    required this.domain,
    required this.roles,
    this.lat,
    this.long,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'],
      userType: map['userType'] ?? '',
      fullName: map['fullName'] ?? '',
      email: map['email'] ?? '',
      phoneNumber: map['phoneNumber'] ?? '',
      instagramUsername: map['instagramUsername'],
      profilePictureUrl: map['profilePictureUrl'],
      province: map['province'] ?? '',
      city: map['city'] ?? '',
      bio: map['bio'],
      domain: map['domain'] ?? '',
      roles: List<String>.from(map['roles'] ?? []),
      lat: (map['lat'] as num?)?.toDouble(),
      long: (map['long'] as num?)?.toDouble(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'userType': userType,
      'fullName': fullName,
      'email': email,
      'phoneNumber': phoneNumber,
      'instagramUsername': instagramUsername,
      'profilePictureUrl': profilePictureUrl,
      'province': province,
      'city': city,
      'bio': bio,
      'domain': domain,
      'roles': roles,
      'lat': lat,
      'long': long,
    };
  }
}
