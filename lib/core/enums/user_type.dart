/// User type
enum UserType {
  creator(
    value: 'creator',
    display: 'Kreator',
  ),
  organizer(
    value: 'organizer',
    display: 'Organizer',
  );

  bool get isCreator => this == UserType.creator;
  bool get isOrganizer => this == UserType.organizer;

  final String value;
  final String display;

  const UserType({
    required this.value,
    required this.display,
  });

  static UserType fromValue(String value) {
    return UserType.values.firstWhere(
      (element) => element.value == value,
      orElse: () => throw ArgumentError('Invalid UserType value: $value'),
    );
  }
}
