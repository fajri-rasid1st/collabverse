enum WilayahType {
  province,
  city;

  bool get isProvince => this == WilayahType.province;
  bool get isCity => this == WilayahType.city;
}
