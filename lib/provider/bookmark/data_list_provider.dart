import 'dart:io';

import 'package:collabverse/data/dummy_bookmark.dart';
import 'package:collabverse/data/dummy_data.dart';
import 'package:collabverse/data/model/bookmark.dart';
import 'package:collabverse/data/model/data.dart';
import 'package:collabverse/static/data_list_result_state.dart';
import 'package:flutter/material.dart';

class DataListProvider extends ChangeNotifier {
  final List<Bookmark> _bookmarkList = List.from(dummyBookmarkList);

  List<Bookmark> get bookmarkList => _bookmarkList;

  String currentUserId = 'user-001';

  List<Bookmark> get userBookmarks =>
    _bookmarkList.where((b) => b.userId == currentUserId).toList();

  List <Data> get bookmarkedData => dummyDataList
    .where((data) =>
      userBookmarks.any((bookmark) => bookmark.postId == data.uuid))
    .toList();
  
  bool isBookmarked(String dataId) {
    return _bookmarkList.any(
      (bookmark) => bookmark.userId == currentUserId && bookmark.postId == dataId,
    );
  }
  //Isi data dummy
  final List<Data> _dataList = dummyDataList;

  List<Data> get dataList => _dataList;

  DataListResultState _resultState = DataListNoneState();

  DataListResultState get resultState => _resultState;

  // Untuk menyimpan hasil pencarian (agar tidak mengubah data asli)
  List<Data> _filteredList = [];
  List<Data> get filteredList => _filteredList.isNotEmpty ? _filteredList : _dataList;

  //Fetch data
  Future<void> fetchDataList() async{
    try {
      _resultState = DataListLoadingState();
      notifyListeners();

      //final result = await get data
      // Simulasi delay seolah sedang fetch dari server
      await Future.delayed(const Duration(seconds: 1));

      // Karena data dummy, langsung assign dari dummyDataList
      _filteredList = _dataList;
      _resultState = DataListLoadedState(_filteredList);
      notifyListeners();
      
    }
    on Exception catch (e){
      String message = "Terjadi kesalahan. Periksa koneksi internet Anda.";

      if (e is SocketException) {
        message = "Tidak ada koneksi internet. Silakan cek jaringan Anda.";
      }
      
      _resultState = DataListErrorState(message);
      notifyListeners();
    }
  }

  Future<void> searchData(String query) async{
    try{
      _resultState = DataListLoadingState();
      notifyListeners();

      //final result
      await Future.delayed(const Duration(milliseconds: 500));

      if (query.isEmpty) {
        _filteredList = _dataList;
      } else {
        _filteredList = _dataList
            .where((data) =>
                data.title.toLowerCase().contains(query.toLowerCase()) ||
                data.city.toLowerCase().contains(query.toLowerCase()) ||
                data.projectType.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
      _resultState = DataListLoadedState(_filteredList);
      notifyListeners();
    } catch (e){
      String message = "Terjadi kesalahan. Periksa koneksi internet Anda.";

      if (e is SocketException) {
        message = "Tidak ada koneksi internet. Silakan cek jaringan Anda.";
      }
      
      _resultState = DataListErrorState(message);
      notifyListeners();
    }
  }

  // --- Add data baru ---
  void addData(Data newData) {
    _dataList.add(newData);
    _filteredList = _dataList;
    _resultState = DataListLoadedState(_filteredList);
    notifyListeners();
  }

  // --- Remove data berdasarkan UUID ---
  void removeData(String uuid) {
    _dataList.removeWhere((data) => data.uuid == uuid);
    _filteredList = _dataList;
    _resultState = DataListLoadedState(_filteredList);
    notifyListeners();
  }

  // --- Toggle Save / Unsave ---
  void toggleSave(String uuid) {
    final index = _dataList.indexWhere((data) => data.uuid == uuid);
    if (index != -1) {
      final currentData = _dataList[index];
      final updatedData = Data(
        uuid: currentData.uuid,
        title: currentData.title,
        desc: currentData.desc,
        imageUrl: currentData.imageUrl,
        projectType: currentData.projectType,
        rolesNeeded: currentData.rolesNeeded,
        totalCreatorsNeeded: currentData.totalCreatorsNeeded,
        // toggle: jika totalSaved == 0 → tambah 1, jika > 0 → kurangi 1
        totalSaved:
            currentData.totalSaved > 0 ? currentData.totalSaved - 1 : currentData.totalSaved + 1,
        city: currentData.city,
        province: currentData.province,
        locationDetail: currentData.locationDetail,
        lat: currentData.lat,
        lang: currentData.lang,
        deadline: currentData.deadline,
        status: currentData.status,
        createdAt: currentData.createdAt,
        updatedAt: DateTime.now(),
      );

      _dataList[index] = updatedData;
      _filteredList = _dataList;
      _resultState = DataListLoadedState(_filteredList);
      notifyListeners();
    }
  }

    // Tambah bookmark baru
  void addBookmark(String dataId) {
    if (!isBookmarked(dataId)) {
      final newBookmark = Bookmark(
        id: 'bkmk-${DateTime.now().millisecondsSinceEpoch}',
        userId: currentUserId,
        postType: 'project',
        postId: dataId,
        createdAt: DateTime.now(),
      );
      _bookmarkList.add(newBookmark);
      notifyListeners();
    }
  }

  // Hapus bookmark
  void removeBookmark(String dataId) {
    _bookmarkList.removeWhere(
      (bookmark) => bookmark.userId == currentUserId && bookmark.postId == dataId,
    );
    notifyListeners();
  }

  // Toggle bookmark (save/unsave)
  void toggleBookmark(String dataId) {
    if (isBookmarked(dataId)) {
      removeBookmark(dataId);
    } else {
      addBookmark(dataId);
    }
  }
}