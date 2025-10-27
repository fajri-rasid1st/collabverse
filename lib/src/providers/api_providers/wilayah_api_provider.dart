// Flutter imports:
import 'package:flutter/foundation.dart';

// Project imports:
import 'package:collabverse/core/enums/result_state.dart';
import 'package:collabverse/src/data/models/wilayah/wilayah_model.dart';
import 'package:collabverse/src/services/api/wilayah_api_service.dart';

class WilayahApiProvider extends ChangeNotifier {
  final WilayahApiService apiService;

  WilayahApiProvider({required this.apiService});

  List<WilayahModel> _data = [];
  ResultState _state = ResultState.loading;
  String _message = '';

  List<WilayahModel> get data => _data;
  ResultState get state => _state;
  String get message => _message;

  set data(List<WilayahModel> restaurants) {
    _data = restaurants;
    notifyListeners();
  }

  Future<void> getProvinces() async {
    _state = ResultState.loading;
    notifyListeners();

    try {
      final result = await apiService.getProvinces();

      _data = result;

      _state = ResultState.success;
    } catch (e) {
      _message = 'Daftar provinsi gagal dimuat. Mohon coba lagi nanti.';

      _state = ResultState.error;
    } finally {
      notifyListeners();
    }
  }

  Future<void> getCities(String provinceCode) async {
    _state = ResultState.loading;
    notifyListeners();

    try {
      final result = await apiService.getCities(provinceCode);

      _data = result;

      _state = ResultState.success;
    } catch (e) {
      _message = 'Gagal memuat daftar kota/kabupaten';

      _state = ResultState.error;
    } finally {
      notifyListeners();
    }
  }
}
