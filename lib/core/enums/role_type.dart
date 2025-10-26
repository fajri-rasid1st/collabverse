/// The role type of a user.
enum RoleType {
  creator(
    value: 'creator',
    display: 'Kreator',
  ),
  organizer(
    value: 'organizer',
    display: 'Organizer',
  );

  final String value;
  final String display;

  const RoleType({
    required this.value,
    required this.display,
  });

  bool get isCreator => this == RoleType.creator;
  bool get isOrganizer => this == RoleType.organizer;

  static RoleType fromValue(String value) {
    return RoleType.values.firstWhere(
      (element) => element.value == value,
      orElse: () => throw ArgumentError('Invalid RoleType value: $value'),
    );
  }
}
