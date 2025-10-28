class WilayahModel {
  final String code;
  final String name;

  const WilayahModel({
    required this.code,
    required this.name,
  });

  factory WilayahModel.fromMap(Map<String, dynamic> map) {
    return WilayahModel(
      code: map['code'] as String? ?? '',
      name: map['name'] as String? ?? '',
    );
  }

  WilayahModel copyWith({
    String? code,
    String? name,
  }) {
    return WilayahModel(
      code: code ?? this.code,
      name: name ?? this.name,
    );
  }
}
